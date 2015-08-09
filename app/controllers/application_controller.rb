class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "darkly"

  before_action :require_auth

  attr_reader :current_user

  protected

  def require_auth
    if user = authenticate_with_http_basic do |u, p| 
      User.find_by(username: u).try :authenticate, p
    end

    @current_user = user
    else
      request_http_basic_authentication
    end
  end


end
