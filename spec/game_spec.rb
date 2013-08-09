require_relative "spec_helper"

describe Game do

  it "Game with zero evolutions has one grid, the same grid that was passed in" do
    grid = Grid.new([Cell.new(0, 0, State.dead)])

    grids = Game.new(grid, 0).grids
    grids.size.should == 1
    grids.first.should == grid
  end


end
