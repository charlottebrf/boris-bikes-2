require './lib/bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    empty?
    bikes.pop
  end

  def docks_bike (bikeinstance)
    full?
    @bikes << bikeinstance
  end

  private

  def full?
    raise('There are no spaces left') if bikes.length >= capacity
  end

  def empty?
    raise('Sorry there are no bikes') if bikes.length < 1
  end

end
