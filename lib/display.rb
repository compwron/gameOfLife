class Display
  def initialize(game)
    @game = game
  end

  def display
    @game.grids.each_with_index { |grid, index|
      clear_screen
      puts "#{grid}\n\nIteration:#{index}"
      sleep 0.5
    }
  end

  def clear_screen
    print "\e[2J\e[f"
  end
end