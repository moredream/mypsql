 class UsersController < ApplicationController
  def omniauth_failure
    redirect_to root_url
    #redirect wherever you want.
  end
end