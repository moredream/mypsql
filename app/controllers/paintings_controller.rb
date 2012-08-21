class PaintingsController < ApplicationController
before_filter :parse_facebook_cookies
def parse_facebook_cookies
  @facebook_cookies ||= Koala::Facebook::OAuth.new('387404467992646', 'd8f8ccf870edb9b37a882178e59ee5cd').get_user_info_from_cookie(cookies)
  # If you've setup a configuration file as shown above then you can just do
  # @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
end
  def new
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @painting = Painting.new(params[:painting])
    if @painting.save
      flash[:notice] = "Successfully created painting."
      redirect_to @painting.gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @painting = Painting.find(params[:id])

  end

  def publish

      @painting = Painting.find(params[:id])

    #  @access_token = @facebook_cookies["access_token"]
     # @graph = Koala::Facebook::GraphAPI.new(@access_token)
      if current_user
        current_user.facebook.put_picture(@painting.image.path,{:message => "Make my ColorCode"})
      end

      @graph.put_picture(@painting.image.path,{:message => "Make my ColorCode"})

    redirect_to  home_show_path, notice: "Review has been created."

  end

  def getmycode
      @random_image = Painting.first(:order => "RANDOM()")

  end

  def show
    @painting = Painting.find(params[:id])

  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      flash[:notice] = "Successfully updated painting."
      redirect_to @painting.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @painting.gallery
  end
end
