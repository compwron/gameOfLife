require_relative "../lib/state"
class SeedParser
  def initialize(seed_file)
    #File.open(seed_file).map { |line|
    #  lines << line
    #}
    #lines
  end

  def cells
    [Cell.new(0, 0, State.live)]
  end
end