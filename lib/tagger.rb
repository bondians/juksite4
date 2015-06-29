# Usage
# require 'tagger'   or "require 'lib/tagger'
# foo = Tagger.new("filename")
# foo.artist  => "Some Artist Guy"


require 'dbconst'
require 'taglib'

# @title
# @album
# @artist
# @genre
# @year
# @track
# @cover
# @apid


class Tagger

  TAG_FOR_NAME = { "mp3" => "id3", "m4a" => "aac", "m4p" => "aac"}
  
  def self.valid?(filename)
    @filename = filename
    return false if filename.match(".AppleDouble")
    namechunks = @filename.split(".")
    return !!Tagger::TAG_FOR_NAME[namechunks.last.downcase]
  end
  
  def initialize(filename)
    @filename = filename
    namechunks = @filename.split(".")
    @filetype = Tagger::TAG_FOR_NAME[namechunks.last.downcase]
    namechunks = @filename.split("/")
    @baseFilename = namechunks.last
    #fail "Unregistered Filetype" unless @filetype
    
    read_frames
  end
  
  def baseName
    @baseFilename
  end
    
  def title=(text)
    return if text == ""
    (text = DBConstant::NO_TITLE) if text == ""
    @tag.title=(text)
  end

  def artist=(text)
    return if text == ""
    (text = DBConstant::NO_ARTIST) if text == ""
    @tag.artist=(text)
  end
  
  def album=(text)
    return if text == ""
    (text = DBConstant::NO_ALBUM) if text == ""
    @tag.album=(text)
  end
  
  def saveChanges
    #@tag.update!
  end
  
  def apid
    return nil unless @filetype == "aac"
    return @tag.apid
  end
  
  def title
    return @title if @title
    return @baseFilename unless @baseFilename.include?("rack")
    return DBConstant::NO_TITLE
  end

  def legacy_num
    #return nil unless @filetype == "mp3"
    #tagText = @tag.find{|t| t[:id]==:TXXX}
    #return tagText[:text].to_i if tagText 
    return nil
  end
  
  def artist
    return @artist if @artist
    return DBConstant::NO_ARTIST
  end
  
  def album
    return @album if @album
    return DBConstant::NO_ALBUM
  end
  
  def genre
    @genre
  end
  
  def year
    @year
  end
  
  def track
    @track
  end
  
  def filetype
    return @filename.split(".").last.downcase
  end
  
  def size
    File.size(@filename)
  end
  
  #{:textenc=>0, :data=>"###############scads of data###########", :description=>"", :imageformat=>"", :mimetype=>"image/jpeg", :id=>:APIC, :picturetype=>3}
  def cover
    nil
  end
  
  def covertype
    #return @tag.covertype if @tag.respond_to?('covertype')
    #cov = @tag.find {|f| f[:id] == :APIC }
    #return "image/jpeg" if cov
    nil
  end
  
  def lookup_genre
    genre_tag = self.genre
    if genre_tag.match(/^\(\d+\)$/)
        num = genre_tag.gsub("(","").gsub(")","").to_i
        genre_tag = DBConstant::GENRES[num]
    end
    
    return convert(genre_tag)
  end
  
  private

  def convert(string)
    out = Iconv.conv('UTF-8', 'LATIN1', string)
    return out if string.length == 1
    out = Iconv.conv('UTF-8', 'UTF-16', string) unless !!out.match(/[[:print:]]{2,}/)
    return out
  end
  
  def read_frames
    #self.send("read_frames_#{@filetype}")  ##old stuff
    # Load a file
    TagLib::FileRef.open(@filename) do |fileref|
    unless fileref.null?
      tag = fileref.tag
      @title   =  tag.title   #=> "Wake Up"
      @artist  =  tag.artist  #=> "Arcade Fire"
      @album   =  tag.album   #=> "Funeral"
      @year    =  tag.year    #=> 2004
      @track   =  tag.track   #=> 7
      @genre   =  tag.genre   #=> "Indie Rock"
      @comment =  tag.comment #=> nil

      properties = fileref.audio_properties
      properties.length  #=> 335 (song length in seconds)
    end
  end  # File is automatically closed at block end
end
end
  