module Jarvis
  class EmailController < ApplicationController
    before_action :set_email, only: [:show, :update, :destroy]
    before_action :set_user

    # GET /users/1
    def show
      render json: Email.new(@email), status: :ok
    end

    # POST /users
    def create
      @email = Email.new(email_params)

      if @email.save
        render json: @email, status: :created, location: @email
      else
        render json: @email.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @email.update(email_params)
        render json: @email, status: :success, location: @email
      else
        render json: @email.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @email.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_email
        @email = Email.find_by(brain_token: email_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def email_params
        return_params = params.require(:email).permit(:brain_token, :email, :tag_brain_token, :user_brain_token)
        return_params = return_params.merge(user_id: @user.id) unless @user.blank?
        return return_params
      end

      def set_user
        @user = User.find_by(brain_token: params[:email][:user][:brain_token])
      end
  end
end
