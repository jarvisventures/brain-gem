module Jarvis
  class DivisionController < ApplicationController
    before_action :set_division, only: [:show, :update, :destroy]
    before_action :set_company

    # GET /users/1
    def show
      render json: @division, status: :ok
    end

    # POST /users
    def create
      @division = Division.new(division_params)
      if @division.save
        render json: @division, status: :created, location: @division
      else
        render json: @division.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @division.update(division_params)
        render json: @division, status: :created, location: @division
      else
        render json: @division.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @division.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_division
        @division = Division.find_by(brain_token: division_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def division_params
        return_params = params.require(:division).permit(:name, :brain_token, :ancestry)
        return_params[:ancestry] = nil if return_params[:ancestry].blank?
        return_params = return_params.merge(company_id: @company.id) unless @company.blank?
        return return_params
      end

      def set_company
        @company = Company.find_by(brain_token: params[:division][:company][:brain_token]) unless params[:division][:company].blank?
      end
  end
end
