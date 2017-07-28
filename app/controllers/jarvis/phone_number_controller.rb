module Jarvis
  class PhoneNumberController < ApplicationController
    before_action :set_phone_number, only: [:show, :update, :destroy]
    before_action :set_user

    # GET /users/1
    def show
      render json: @phone_numbers, status: :ok
    end

    # POST /users
    def create
      @phone_number = PhoneNumber.new(phone_number_params)
      if @phone_number.save
        render json: @phone_number, status: :created, location: @phone_number
      else
        render json: @phone_number.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @phone_number.update(phone_number_params)
        render json: @phone_number, status: :success, location: @phone_number
      else
        render json: @phone_number.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @phone_number.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_phone_number
        @phone_number = PhoneNumber.find_by(brain_token: phone_number_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def phone_number_params
        return_params = params.require(:phone_number).permit(:brain_token, :phone_number)
        return_params = return_params.merge(user_id: @user.id) unless @user.blank?
        return return_params
      end

      def set_user
        @user = User.find_by(brain_token: params[:phone_number][:user][:brain_token]) unless params[:phone_number][:user].blank?
      end
  end
end
