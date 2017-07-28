module Jarvis
  class UserTagController < ApplicationController
    before_action :set_user_tag, only: [:show, :update, :destroy]
    before_action :set_user, :set_tag

    # GET /users/1
    def show
      render json: @user_tag, status: :ok
    end

    # POST /users
    def create
      @user_tag = UserTag.new(user_tag_params)
      if @user_tag.save
        render json: @user_tag, status: :created, location: @user_tag
      else
        render json: @user_tag.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user_tag.update(user_tag_params)
        render json: @user_tag, status: :created, location: @user_tag
      else
        render json: @user_tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user_tag.destroy
    end

    private
      def set_user_tag
        @user_tag = UserTag.find_by(brain_token: user_tag_params[:brain_token])
      end

      def user_tag_params
        return_params = params.require(:user_tag).permit(:brain_token)
        return_params = return_params.merge(user_id: @user.id) unless @user.blank?
        return_params = return_params.merge(tag_id: @tag.id) unless @tag.blank?
        return return_params
      end

      def set_user
        @user = User.find_by(brain_token: user_params[:brain_token])
      end

      def user_params
        params.require(:user_tag).require(:user).permit(:brain_token, :first_name, :last_name, :token, :address_1, :address_2, :city, :state, :zipcode, :country, :age, :date_of_birth, :ethnicity, :gender, :marital_status, :active, :employee_number, :hire_date,
        :termination_date, :ancestry, :last_changed, :password, :password_confirmation)
      end

      def set_tag
        @tag = Tag.find_by(brain_token: tag_params[:brain_token])
      end

      def tag_params
        params.require(:user_tag).require(:tag).permit(:tag, :brain_token)
      end
  end
end
