class Currentsong < ActiveRecord::Base
  belongs_to :song
  
  def self.playing
    song = `script/currentsong.sh`
    song.chomp! if song
  end
  
  def self.setPlaying (song)
    old = Currentsong.new
    old.song = song
    old.save
  end
end
