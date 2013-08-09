require_relative "spec_helper"

describe Game do

  it "Game with zero evolutions has one grid, the same grid that was passed in" do
    grid = Grid.new([Cell.new(0, 0, State.dead)])

    grids = Game.new(grid, 0).grids
    grids.size.should == 1
    grids.first.should == grid
  end

  it "Game with one iteration contains the passed-in grid and the evolution of the passed-in grid" do
    seed_grid = Grid.new([Cell.new(0, 0, State.live)])
    first_evolved_grid = Grid.new([Cell.new(0, 0, State.dead)])

    grids = Game.new(seed_grid, 1).grids
    grids.size.should == 2
    grids.should include seed_grid
    grids.should include first_evolved_grid
  end


end
