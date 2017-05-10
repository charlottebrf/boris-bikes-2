require './lib/bike.rb'

class DockingStation
attr_reader :bike

  def release_bike
    Bike.new
  end

  def docks_bike (bikeinstance)
    @bike = bikeinstance
  end
end
