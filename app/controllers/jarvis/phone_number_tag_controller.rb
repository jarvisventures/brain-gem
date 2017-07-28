module Jarvis
  class PoneNumberTagController < ApplicationController
    before_action :set_phone_number_tag, only: [:show, :update, :destroy]
    before_action :set_phone_number, :set_tag

    # GET /users/1
    def show
      render json: @phone_number_tag, status: :ok
    end

    # POST /users
    def create
      @phone_number_tag = PhoneNumberTag.new(phone_number_tag_params)
      if @phone_number_tag.save
        render json: @phone_number_tag, status: :created, location: @phone_number_tag
      else
        render json: @phone_number_tag.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @phone_number_tag.update(phone_number_tag_params)
        render json: @phone_number_tag, status: :success, location: @phone_number_tag
      else
        render json: @phone_number_tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @phone_number_tag.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_phone_number_tag
        @phone_number_tag = PhoneNumberTag.find_by(brain_token: phone_number_tag_params[:brain_token])
      end

      def set_phone_number
        @phone_number = PhoneNumber.find_by(brain_token: phone_number_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def phone_number_params
        params.require(:phone_number_tag).require(:phone_number).permit(:brain_token, :phone_number)
      end

      def set_tag
        @tag = Tag.find_by(brain_token: tag_params[:brain_token])
      end

      def tag_params
        params.require(:phone_number_tag).require(:tag).permit(:tag, :brain_token)
      end

      def phone_number_tag_params
        return_params = params.require(:phone_number_tag).permit(:brain_token)
        return_params = return_params.merge(tag_id: @tag.id) unless @tag.blank?
        return_params = return_params.merge(phone_number_id: @phone_number.id) unless @phone_number.blank?
        return return_params
      end
  end
end
