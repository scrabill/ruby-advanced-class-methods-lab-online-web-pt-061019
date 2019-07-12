class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # .create extends functionality of the initialize method as opposed to modifying it
    c = self.new # Same as Song.new
    c.save # Saves the newly created song to the @@all field
    c # Returns the newly created song
  end

  def self.new_by_name(name)
    # Note, without a def instantiate method, self.new cannot take an argument like (name)
    song = self.new # Create a new song
    song.name = name
    song # Pay attention to return value of the tests
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save # Run the save method on the newly created song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name} # self.all = @@all = every Song instance that we've created
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil # If the song does not already exist...
      self.create_by_name(name) # Create it...
    else
      self.find_by_name(name) # Otherwise, return the song object
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name} # Get the name property for each song and sort by it
  end

  def self.new_from_filename(file_name)

    x = file_name.split(" - ") # Creates a new array, splitting "Taylor Swift - Blank Space.mp3" at the " - "
    artist_name = x[0] # Assigns "Taylor Swift" as the artist name
    song_name = x[1].gsub(".mp3", "") # Assigns "Blank Space" as the song name and replaces .mp3 with am empty string, which removes it.

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song

    ## From Lantz
    # def self.create_from_filename(filename)
    #   data = filename.split(" - ")
    #   artist_name = data[0]
    #   song_name = data[1].gsub(".mp3", "")
    #   song = self.create
    #   song.name = song_name
    #   song.artist_name = artist_name
    #   song
    #  end

    # My original
    # x = file_name.split(" - ") # Creates a new array
    # song_name = x[1].gsub(".mp3","")
    #
    # artist_name = x[0]
    #
    # song = self.create
    # song.name = song_name
    # song.artist_name = artist_name
  end


    # Taylor Swift - Blank Space.mp3
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
