class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.xml
  def index
    params[:page] ||= 1
    @albums = Album.paginate(page: params[:page], :per_page => 50).search(params[:search])
    
      respond_to do |format|
        format.html
        format.xml { render :xml => @albums }
      end

  end
  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.where(params[:id]).includes(:songs).first
  end

end
