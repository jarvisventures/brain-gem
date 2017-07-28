module Jarvis
  class TagController < ApplicationController
    before_action :set_tag, only: [:show, :update, :destroy]

    # GET /users/1
    def show
      render json: @tag, status: :ok
    end

    # POST /users
    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        render json: @tag, status: :created, location: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @tag.update(tag_params)
        render json: @tag, status: :created, location: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @tag.destroy
    end

    private
      def set_tag
        @tag = Tag.find_by(brain_token: tag_params[:brain_token])
      end

      def tag_params
        params.require(:tag).permit(:tag, :brain_token)
      end
  end
end
