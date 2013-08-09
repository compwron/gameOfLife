class Display
  def initialize(game)
    @game = game
  end

  def display
    @game.grids.each { |grid|
      clear_screen
      puts grid
      sleep 0.5
    }
  end

  def clear_screen
    print "\e[2J\e[f"
  end
end