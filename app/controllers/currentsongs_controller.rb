class CurrentsongsController < ApplicationController

  def index
    params[:page] ||= 1
    @playentries = Currentsong.paginate(page: params[:page], :per_page => 50).order('id DESC')    
    respond_to do |format|
      format.html
      format.xml { render :xml => @songs }
    end
  end

end

