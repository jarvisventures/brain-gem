module Jarvis
  class SsosController < ApplicationController
    before_action :set_user, only: [:login]
    access all: :all
    skip_before_action :verify_authenticity_token

    def login
      sign_in(@user)
      redirect_to root_path
    end

    private
      def set_user
        @user = User.find_by(jarvis_token: params[:jarvis_token])
      end
  end
end
