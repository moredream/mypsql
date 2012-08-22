class HomeController < ApplicationController
  def index
 	@graph = Koala::Facebook::GraphAPI.new(facebook_cookies["access_token"])
      @profile = @graph.get_object("me")
  end

  def show
  end
end
