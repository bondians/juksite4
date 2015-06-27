class SelectionsController < ApplicationController
  include ActionController::Live
  require 'reloader/sse'

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
    redirect_to(selections_url) unless new_index
    Reqlist.set_index(new_index)
    redirect_to(selections_url)
  end
  
  def events
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'
    
    sse = Reloader::SSE.new(response.stream)
    start = Song.check_queue
      loop do
        nextstart = Song.check_queue
        unless nextstart == start
          start = nextstart
          sse.write({ :dirs => "dirs" }, :event => 'refresh')
        end
        sleep 10
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
  end

  
  
end
