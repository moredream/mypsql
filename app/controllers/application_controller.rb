class ApplicationController < ActionController::Base
  protect_from_forgery



private

def facebook_cookies
	@facebook_cookies ||= Koala::Facebook::OAuth.new('387404467992646', 'd8f8ccf870edb9b37a882178e59ee5cd').get_user_info_from_cookie(cookies)

#@facebook_cookies = User.from_omniauth(env["omniauth.auth"]) 

 end
helper_method :facebook_cookies

# def facebook_cookies
# 	@facebook_cookies ||= Koala::Facebook::OAuth.new('387404467992646', 'd8f8ccf870edb9b37a882178e59ee5cd').get_user_info_from_cookie(cookies)
# #@facebook_cookies = User.from_omniauth(env["omniauth.auth"]) 

# end
#helper_method :facebook_cookies


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # begin
    #   # allow for ?access_token=[TOKEN] for iOS calls.
    #   @access_token = session[:access_token] || facebook_cookies[:access_token]
    #   @graph = Koala::Facebook::API.new(@access_token)
    #   # TODO: move this to session[:current_user]..
    #   @current_user ||= User.from_graph @graph.get_object('me', { fields: 'id,first_name,last_name,gender,birthday' })
    # rescue
    #   nil # not logged in
    # end
  end
helper_method :current_user
  
end
