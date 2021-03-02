require './lib/artist.rb'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        name = filename.split(" - ")[1]
        song = self.new(name)
        song.artist_name=filename.split(" - ")[0]
        song
    end

    def artist_name=(artist)
        artist_inst = Artist.find_or_create_by_name(artist)
        artist_inst.add_song(self)
    end

end