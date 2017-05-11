require './lib/bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise('Sorry there are no bikes') if bikes.length < 1
    bikes.pop
  end

  def docks_bike (bikeinstance)
    raise('There are no spaces left') if bikes.length >= 20
    @bikes << bikeinstance
  end

end
