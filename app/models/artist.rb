class Artist < ActiveRecord::Base
  has_many :songs

  def self.search(search)
    where('name like ?', "%#{search}%")
  end

  def albums
    self.songs.map{|song| song.album}.uniq
  end
  
end
