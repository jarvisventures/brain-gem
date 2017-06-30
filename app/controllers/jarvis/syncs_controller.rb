module Jarvis
  class SyncsController < ApplicationController
    access all: :all
    skip_before_action :verify_authenticity_token
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
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

    private
      def set_user
        @user = User.find(params[:jarvis_token])
      end

      def user_params
        params.require(:user).permit(:id, :company_id, :division_id, :department_id, :first_name, :last_name, :email, :token, :address_1, :address_2, :city, :state, :zipcode, :country, :home_phone, :mobile_phone, :age, :date_of_birth, :ethnicity, :gender, :marital_status, :active, :employee_number, :hire_date,
        :termination_date, :ancestry, :last_changed, :password, :password_confirmation)
      end
  end
end
