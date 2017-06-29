module Jarvis
  class SyncsController < ApplicationController
    def create
      # This is where we'll create users from the Brain
      Brain.create_user(params[:user])
    end

    def update
      # This is where we'll update users from the Brain
      Brain.update_user(params[:user_id], params[:update])
    end

    def destroy
      # This is where we'll destroy users from the Brain
      Brain.destroy_user(params[:user_id])
    end
  end
end
