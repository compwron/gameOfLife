class State
  def self.live
    1
  end

  def self.dead
    0
  end

  def self.random
    random = rand(2)
    random_change = rand(2)

    (random == 1 || random_change == 1) ? 1 : 0
  end
end