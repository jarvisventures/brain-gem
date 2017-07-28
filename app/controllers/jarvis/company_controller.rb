module Jarvis
  class CompanyController < ApplicationController
    before_action :set_company, only: [:show, :update, :destroy]

    # GET /users/1
    def show
      render json: @company, status: :ok
    end

    # POST /users
    def create
      @company = Company.new(company_params)
      if @company.save
        render json: @company, status: :created, location: @company
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @company.update(company_params)
        render json: @company, status: :created, location: @company
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @company.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find_by(brain_token: company_params[:brain_token])
      end

      # Only allow a trusted parameter "white list" through.
      def company_params
        params.require(:company).permit(:name, :brain_token, :subdomain, :active, :stripe_token, :logo)
      end
  end
end
