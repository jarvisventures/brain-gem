module Jarvis
  class SyncsController < ApplicationController
    @@brain = Brain.new(Rails.application.config.api_token)
    def create
      # This is where we'll create users from the @brain
      @@brain.create_user(params[:user])
    end

    def update
      # This is where we'll update users from the @brain
      @@brain.update_user(params[:user_id], params[:update])
    end

    def destroy
      # This is where we'll destroy users from the @brain
      @@brain.destroy_user(params[:user_id])
    end
  end
end
