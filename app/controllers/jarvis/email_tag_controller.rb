module Jarvis
  class EmailTagController < ApplicationController
    before_action :set_email_tag, only: [:show, :update, :destroy]
    before_action :set_email, :set_tag

    # GET /users/1
    def show
      render json: @email_tag, status: :ok
    end

    # POST /users
    def create
      @email_tag = EmailTag.new(email_tag_params)
      if @email_tag.save
        render json: @email_tag, status: :created, location: @email_tag
      else
        render json: @email_tag.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @email_tag.update(email_tag_params)
        render json: @email_tag, status: :created, location: @email_tag
      else
        render json: @email_tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @email_tag.destroy
    end

    private
      def set_email_tag
        @email_tag = EmailTag.find_by(brain_token: email_tag_params[:brain_token])
      end

      def email_tag_params
        return_params = params.require(:email_tag).permit(:brain_token)
        return_params = return_params.merge(email_id: @email.id) unless @email.blank?
        return_params = return_params.merge(tag_id: @tag.id) unless @tag.blank?
        return return_params
      end

      def set_email
        @email = Email.find_by(brain_token: email_params[:brain_token])
      end

      def email_params
        params.require(:email_tag).require(:email).permit(:brain_token, :email)
      end

      def set_tag
        @tag = Tag.find_by(brain_token: tag_params[:brain_token])
      end

      def tag_params
        params.require(:email_tag).require(:tag).permit(:tag, :brain_token)
      end
  end
end
