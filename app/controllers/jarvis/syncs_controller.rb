module Jarvis
  class SyncsController < ApplicationController
    access all: :all
    skip_before_action :verify_authenticity_token
    def create
      # This is where we'll create users from the Brain
      puts "hey!"
    end

    def update
      # This is where we'll update users from the Brain
    end

    def destroy
      # This is where we'll destroy users from the Brain
    end
  end
end
