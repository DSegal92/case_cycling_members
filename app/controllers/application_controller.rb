class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_session
  private
  def current_user
  	@current_user ||= Member.find(session[:member_id]) if session[:member_id]
  end

  def check_session
  	if current_user
  	true
  else 
  	redirect_to root_url
  	flash[:error] = "You must be logged in to access this page."
  end
  end
end
