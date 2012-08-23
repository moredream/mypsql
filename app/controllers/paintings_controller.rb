class PaintingsController < ApplicationController

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
         # begin
    #   # allow for ?access_token=[TOKEN] for iOS calls.
    #   @access_token = session[:access_token] || facebook_cookies[:access_token]
    #   @graph = Koala::Facebook::API.new(@access_token)
    #   # TODO: move this to session[:current_user]..
    #   @current_user ||= User.from_graph @graph.get_object('me', { fields: 'id,first_name,last_name,gender,birthday' })
    # rescue
    #   nil # not logged in
    # end
        graph = Koala::Facebook::API.new(facebook_cookies["access_token"])
      
      if graph
        graph.put_picture(@painting.image.path,{:message => "Make my ColorCode"})
      end
      

      # if current_user
      #   current_user.facebook.put_picture(@painting.image.path,{:message => "Make my ColorCode"})
      # end

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
