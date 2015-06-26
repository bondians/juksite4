class Album < ActiveRecord::Base
  has_many :songs
  
  def self.search(search)
    where('name like ?', "%#{search}%")
  end

  def genre
    self.songs.map{|song| song.genre}.first
  end
  
  def artists
    self.songs.map{|song| song.artist}.uniq
  end

end
