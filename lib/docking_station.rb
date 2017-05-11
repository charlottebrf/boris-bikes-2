require './lib/bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
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
    raise('There are no spaces left') if bikes.length >= 20
  end

  def empty?
    raise('Sorry there are no bikes') if bikes.length < 1
  end

end
