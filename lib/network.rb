class Network

  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  # def main_characters
  #WHAT ON EARTH DETERMINES THE MAIN CHARACTER
  #   @shows.characters.first
  # end

  def actors_by_show
    @shows.flat_map do |character, actor|
      character.actors
    end

  end
end
