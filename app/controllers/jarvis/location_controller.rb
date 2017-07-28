module Jarvis
  class LocationController < ApplicationController
    before_action :set_location, only: [:show, :update, :destroy]
    before_action :set_company

    # GET /users/1
    def show
      render json: @location, status: :ok
    end

    # POST /users
    def create
      @location = Location.new(location_params)
      if @location.save
        render json: @location, status: :created, location: @location
      else
        render json: @location.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @location.update(location_params)
        render json: @location, status: :created, location: @location
      else
        render json: @location.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @location.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_location
        @location = Location.find_by(brain_token: location_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def location_params
        return_params = params.require(:location).permit(:name, :brain_token, :ancestry)
        return_params[:ancestry] = nil if return_params[:ancestry].blank?
        return_params = return_params.merge(company_id: @company.id) unless @company.blank?
        return return_params
      end

      def set_company
        @company = Company.find_by(brain_token: params[:location][:company][:brain_token]) unless params[:location][:company].blank?
      end
  end
end
