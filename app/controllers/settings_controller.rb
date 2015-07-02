class SettingsController < ApplicationController
  
  def index
    @playlists = Playlist.includes(:user, :plentries).to_a
    @playlists.sort! {|x,y| x.user.name <=> y.user.name}
    @setting = Setting.current
    #@themes = Setting.themes
    vol = `defaults read com.deepbondi.cocoaJukebox kMasterVolume`
    vol = 1.0 if (vol.nil? or vol.empty?)
    @currentVolume = vol.to_f
  end
  
  def update
    if (params[:editing] && params[:editing] == "playlists")
      Setting.allow_playlists= true
    else
      Setting.allow_playlists= false
    end
    if (params[:theme] && params[:theme] != Setting.theme)
      Setting.theme= params[:theme]
    end
    if (params[:playlist] && params[:playlist]["playlist_ids"])
      active =  params[:playlist]["playlist_ids"].collect{|a| a.to_i}
    else
      active = []
    end
    
    playlists = Playlist.all
    playlists.each do |list|
      active.include?(list.id) ? list.active = true : list.active = false
      list.save
    end
    redirect_to(selections_url)
  end
  
  def setvolume
    vol = `defaults read com.deepbondi.cocoaJukebox kMasterVolume`
    vol = 1.0 if (vol.empty?)
    currentVolume = vol.to_f
    newVolume = params[:newVolume].to_f
    newVolume = 1.0 if newVolume > 1.0
    unless (currentVolume == newVolume)
      app = (Rails.root.to_s + "/script/jookieControl -volume")
      system "#{app} #{newVolume}"
    end
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
  
  def action
    app = (Rails.root.to_s + "/script/jookieControl -action")
    what = params[:do]
    if what
      case what
      when "playerSkip"
        system "#{app} skipsong"
      when "playerStartStop"
        system "#{app} startstop"
      when "playerPause"
        system "#{app} pause"
      else
        
      end
    end
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
  
end
