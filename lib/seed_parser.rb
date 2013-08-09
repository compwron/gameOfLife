require_relative "../lib/state"
class SeedParser
  attr_reader :cells

  def initialize(seed_file)
    @cells = cells_from(lines_in(seed_file))
  end

  def lines_in(seed_file)
    lines = []
    File.open(seed_file).map { |line|
      lines << line
    }
    lines
  end

  def cells_from(lines)
    cells = []
    lines.each_with_index{|line, y_index|
      line.strip.split('').each_with_index{|state, x_index|
         cells << Cell.new(x_index, y_index, state.to_i)
      }
    }
    cells
  end
end