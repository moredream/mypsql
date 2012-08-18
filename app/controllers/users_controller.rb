 class UsersController < ApplicationController
before_filter :parse_facebook_cookies

	def parse_facebook_cookies
	  #@facebook_cookies ||= Koala::Facebook::OAuth.new(YOUR_APP_ID, YOUR_SECRET).get_user_info_from_cookie(cookies)

	  # If you've setup a configuration file as shown above then you can just do
	   @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
	end
	
	def omniauth_failure
	redirect_to root_url
	#redirect wherever you want.
	end
end