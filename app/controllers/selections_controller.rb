class SelectionsController < ApplicationController
  def index
    randlist = Randlist.order(:sort)
    @randsongs = randlist.map{|a| a.song}
    reqlist = Reqlist.order(:sort)
    @reqsongs = reqlist.map{|p| p.song.form_idx = p.id; p.song}
    
    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.rjs
    end
    
  end
  
  def set_order
    new_index = params[:index]
    Reqlist.set_index(new_index)
    redirect_to(selections_url)
  end
  
end
