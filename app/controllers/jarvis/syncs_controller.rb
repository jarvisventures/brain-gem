module Jarvis
  class SyncsController < ApplicationController
    before_action :set_user, only: [:update, :destroy, :login]
    access all: :all
    skip_before_action :verify_authenticity_token

    def create
      user_json = params[:user]
      company = company_from_json(user_json[:company])
      division = division_from_json(user_json[:division], company)
      department = department_from_json(user_json[:department], company)
      supervisor = super_from_json(user_json[:parent], company)
      uj = user_json
      user_name = "#{user_json[:first_name]} #{user_json[:last_name]}"
      @user = User.new(name: user_name, api_token: uj[:api_token], parent_id: supervisor.id, first_name: uj[:first_name], last_name: uj[:last_name], email: uj[:email], company: @company, division: division, department: department, password: 'hahahahaha', password_confirmation: 'hahahahaha')
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      user_json = params[:user]
      company = company_from_json(user_json[:company])
      division = division_from_json(user_json[:division], company)
      department = department_from_json(user_json[:department], company)
      supervisor = super_from_json(user_json[:parent], company)
      uj = user_json
      user_name = "#{user_json[:first_name]} #{user_json[:last_name]}"
      if @user.update(name: user_name, api_token: uj[:api_token], parent_id: supervisor.id, first_name: uj[:first_name], last_name: uj[:last_name], email: uj[:email], company: @company, division: division, department: department, password: 'hahahahaha', password_confirmation: 'hahahahaha')
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @user.destroy
        render json: 'deleted', status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def login
      sign_in(@user)
      redirect_to authenticated_root_path
    end

    private
      def set_user
        @user = User.find_by(api_token: params[:api_token])
      end

      def company_from_json(json)
        @company = Company.find_by(api_token: json[:api_token])
        if @company
          @company.update(name: json[:name], subdomain: json[:subdomain])
        else
          @company = Company.create!(name: json[:name], subdomain: json[:subdomain], api_token: json[:api_token])
        end
        return @company
      end

      def division_from_json(json, company)
        division = company.divisions.find_or_initialize_by(api_token: json[:api_token])
        division.update_attributes(name: json[:name])
        return division
      end

      def department_from_json(json, company)
        department = Department.find_or_initialize_by(api_token: json[:api_token], company: company)
        department.update_attributes(name: json[:name])
        return department
      end

      def super_from_json(json, company)
        supervisor = company.users.find_or_initialize_by(api_token: json[:api_token])
        user_name = "#{json[:first_name]} #{json[:last_name]}"
        supervisor.update_attributes(name: user_name, api_token: json[:api_token], first_name: json[:first_name], last_name: json[:last_name], email: json[:email], password: 'hahahahaha', password_confirmation: 'hahahahaha')
        return supervisor
      end

      def user_params
        params.require(:user).permit(:id, :api_token, :company_token, :division_token, :department_token, :first_name, :last_name, :email, :token, :address_1, :address_2, :city, :state, :zipcode, :country, :home_phone, :mobile_phone, :age, :date_of_birth, :ethnicity, :gender, :marital_status, :active, :employee_number, :hire_date,
        :termination_date, :ancestry, :last_changed, :password, :password_confirmation)
      end
  end
end
