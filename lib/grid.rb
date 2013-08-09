require_relative "../lib/state"
require_relative "../lib/cell"

class Grid
  def initialize(cells)
  end

  def getCell(x, y)
     Cell.new(x, y, State.live)
  end
end