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
            token = params[:token]
      begin

        graph = Koala::Facebook::API.new(token)
        if graph
          graph.put_picture(@painting.image.path,{:message => "Make my ColorCode"})
        end
        redirect_to  home_show_path, notice: "Review has been created."
      
      rescue
        redirect_to  getmycode_path, notice: "Please Login with Facebook."
      end



  end

  def getmycode
      @token = params[:token]

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
