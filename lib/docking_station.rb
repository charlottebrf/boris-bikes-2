require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    if bike == nil
      raise('Sorry there are no bikes')
    else
      Bike.new
    end
  end

  def docks_bike (bikeinstance)
    @bike = bikeinstance
  end

end
