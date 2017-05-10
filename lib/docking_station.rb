require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    if bike == nil
      raise('Sorry there are no bikes')
    else
      bike
    end
  end

  def docks_bike (bikeinstance)
    if bike != nil
      raise('There are no spaces left')
    else
      @bike = bikeinstance
    end
  end
end
