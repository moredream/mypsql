class HomeController < ApplicationController
  def index
	begin
		@graph = Koala::Facebook::API.new(facebook_cookies["access_token"])
		@profile = @graph.get_object("me")
	rescue
	  nil # not logged in
	end
  end

  def show
  end
end
