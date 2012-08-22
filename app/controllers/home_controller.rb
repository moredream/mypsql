class HomeController < ApplicationController
  def index
	@graph = Koala::Facebook::GraphAPI.new(facebook_cookies["access_token"])
	@profile = @graph.get_object("me")
	resque
	nil
  end

  def show
  end
end
