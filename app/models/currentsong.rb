class Currentsong < ActiveRecord::Base
  belongs_to :song
  
  def self.playing
# to do put this back for osx
song = "none"
    #song = `defaults read com.deepbondi.cocoaJukebox kCurrentSong`
    #song.chomp!
  end
  
  def self.setPlaying (song)
    old = Currentsong.new
    old.song = song
    old.save
  end
end
