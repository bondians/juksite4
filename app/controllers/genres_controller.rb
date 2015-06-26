class GenresController < ApplicationController
  # GET /genres
  # GET /genres.xml
  def index
    #@genres = Genre.find(:all)
    @genres = Genre.paginate(page: params[:page], :per_page => 50).search(params[:search])
  end

  # GET /genres/1
  # GET /genres/1.xml
  def show
    @genre = Genre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @genre }
    end
  end

end
