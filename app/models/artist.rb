require 'pry'

class Artist

  attr_reader :name, :years_experience

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
  end

  def all
    paintings = Painting.all.select do |painting|
      painting.artist == self
    end
    paintings.map do |painting|
      painting.artist
    end
  end

  def paintings
    Painting.all.select do |painting|
      painting.artist == self
    end
  end

  def galleries
    galleries = paintings.map do |painting|
      painting.gallery
    end
    galleries.uniq
  end

  def cities
    cities = galleries.map do |gallery|
      gallery.city
    end
    cities.uniq
  end

  def total_experience
    self.all.reduce(0) do |sum, artist|
      sum + artist.years_experience
    end
  end

  def most_prolific
    self.all.max_by do |artist|
      artist.paintings.length / artist.years_experience
    end
  end
    
  def create_painting(title, price, gallery)
    new_painting = Painting.new(title, price, self, gallery)
  end

end
