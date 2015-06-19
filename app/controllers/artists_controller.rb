class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.xml

  def index
    params[:page] ||= 1
      @artists = Artist.paginate(page: params[:page], :per_page => 50).search(params[:search])

      respond_to do |format|
        format.html
        format.xml { render :xml => @artists }
      end
  end
  # GET /artists/1
  # GET /artists/1.xml
  def show
    @artist = Artist.find params[:id]
  end

end
