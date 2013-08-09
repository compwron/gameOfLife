class Game
  attr_accessor :grids
  def initialize(seed_grid, evolutions)
    @grids = evolve_grids(seed_grid, evolutions)
  end

  def evolve_grids(grid, evolutions, grids=[])
    puts "evolutions #{evolutions} grids #{grids}"
    grids << grid
    if evolutions > 0
      next_grid = Grid.new(grid.evolve(grid.cells))
      evolve_grids(next_grid, evolutions-1, grids)
    end
    grids
  end
end