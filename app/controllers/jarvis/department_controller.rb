module Jarvis
  class DepartmentController < ApplicationController
    before_action :set_department, only: [:show, :update, :destroy]
    before_action :set_company

    # GET /users/1
    def show
      render json: @department, status: :ok
    end

    # POST /users
    def create
      @department = Department.new(department_params)
      if @department.save
        render json: @department, status: :created, location: @department
      else
        render json: @department.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @department.update(department_params)
        render json: @department, status: :created, location: @department
      else
        render json: @department.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @department.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_department
        @department = Department.find_by(brain_token: department_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def department_params
        return_params = params.require(:department).permit(:name, :brain_token, :ancestry)
        return_params[:ancestry] = nil if return_params[:ancestry].blank?
        return_params = return_params.merge(company_id: @company.id) unless @company.blank?
        return return_params
      end

      def set_company
        @company = Company.find_by(brain_token: params[:department][:company][:brain_token]) unless params[:department][:company].blank?
      end
  end
end