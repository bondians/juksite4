class Genre < ActiveRecord::Base
  has_many :songs

  def self.search(search)
    where('name like ?', "%#{search}%")
  end
  
end
