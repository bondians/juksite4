class NextsongsController < ApplicationController
  def index
    item = nil
    if Randlist.count < 10
      Randlist.padRands
    end
    
    until (item && (item.song.songtype_id != 2 || (!item.song.apid || (!!item.song.apid && !!item.song.apid.active))))
      item.destroy if item
      if Randlist.count < 10
        Randlist.padRands
      end
      item = Reqlist.order(:sort).first
      item ||= Randlist.order(:sort).first
    end

      
    
    if item
      @song = item.song
      item.destroy
    end
    
    @song ||= Song.first ## give up something NMW
    Currentsong.setPlaying(@song)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
      format.txt
    end
  end
  
  
end
