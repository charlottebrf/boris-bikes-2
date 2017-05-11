require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    raise('Sorry there are no bikes') if bike == nil
    bike
  end

  def docks_bike (bikeinstance)
    raise('There are no spaces left') if bike != nil
    @bike = bikeinstance
  end

end
