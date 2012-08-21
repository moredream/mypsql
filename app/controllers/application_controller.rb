class ApplicationController < ActionController::Base
  protect_from_forgery



private
	
def facebook_cookies
	@facebook_cookies ||= Koala::Facebook::OAuth.new('387404467992646', 'd8f8ccf870edb9b37a882178e59ee5cd').get_user_info_from_cookie(cookies)
end
  helper_method :facebook_cookies
  def current_user

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end
