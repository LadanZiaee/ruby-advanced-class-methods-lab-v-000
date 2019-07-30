class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    new_name = self.new
    new_name.name = name
    new_name
  end 
  
  def self.create_by_name(name)
    create_name = self.create
    create_name.name = name 
    create_name 
  end 
  
  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by {|w| w.name}
  end
  
  def self.new_from_filename(name)
      word = name.delete_suffix!(".mp3")
      song = word.split(" - ")
      artist = song[0]
      name = song[1]
      
      song_info = self.new
      song_info.name = name
      song_info.artist_name = artist
      song_info
  end 
  
  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end