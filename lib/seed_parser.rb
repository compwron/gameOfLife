require_relative "../lib/state"
class SeedParser
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
    current = []
    lines.each_with_index{|line, y_index|
      line.strip.split('').each_with_index{|state, x_index|

      }
    }
  end

  def cells
    [Cell.new(0, 0, State.live)]
  end
end