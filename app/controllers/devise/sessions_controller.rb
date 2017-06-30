module Jarvis
  class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    puts "here baby"
    #self.resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_navigational_format?
    # sign_in(User.first)
    # if !session[:return_to].blank?
    #   redirect_to session[:return_to]
    #   session[:return_to] = nil
    # else
    #   respond_with resource, :location => after_sign_in_path_for(resource)
    # end
  end

  end
end
