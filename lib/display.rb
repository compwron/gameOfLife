class Display
  def initialize(game)
    @game = game
  end

  def evolve(evolutions)

  end

  def display
    @game.grids.each { |grid|
      puts grid
      `clear`
    }
  end
end