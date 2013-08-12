class RandomSeed
  attr_reader :cells

  def initialize max_side_length
    @cells = make_cells(non_zero_random(max_side_length), non_zero_random(max_side_length))
  end

  def make_cells(width, height)
    (1..(width * height)).map { |count|
      x = (count -1) % width
      y = (count -1) / height
      Cell.new(x, y, State.random)
    }
  end

  def non_zero_random max
    random = rand(max)
    random == 0 ? 1 : random
  end
end