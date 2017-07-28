# require "jarvis/application_controller"

module Jarvis
  class UserController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :set_company, :set_department, :set_division, :set_location

    # GET /users/1
    def show
      render json: @user, status: :ok
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user, status: :success, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private
      def set_user
        @user = User.find_by(brain_token: user_params[:brain_token])
      end

      def user_params
        return_params = params.require(:user).permit(:brain_token, :first_name, :last_name, :token, :address_1, :address_2, :city, :state, :zipcode, :country, :age, :date_of_birth, :ethnicity, :gender, :marital_status, :active, :employee_number, :hire_date,
        :termination_date, :ancestry, :last_changed, :password, :password_confirmation)
        return_params = return_params.merge(company_id: @company.id) unless @company.blank?
        return_params = return_params.merge(department_id: @department.id) unless @department.blank?
        return_params = return_params.merge(division_id: @division.id) unless @division.blank?
        return_params = return_params.merge(location_id: @location.id) unless @location.blank?
        return return_params
      end

      def set_company
        @company = Company.find_by(brain_token: params[:user][:company][:brain_token]) unless params[:user][:company].blank?
      end

      def set_department
        @department = Department.find_by(brain_token: params[:user][:department][:brain_token]) unless params[:user][:department].blank?
      end

      def set_division
        @division = Division.find_by(brain_token: params[:user][:division][:brain_token]) unless params[:user][:division].blank?
      end

      def set_location
        @location = Location.find_by(brain_token: params[:user][:location][:brain_token]) unless params[:user][:location].blank?
      end
  end
end
