require 'docking_station'

describe DockingStation do
  subject(:station){ DockingStation.new }
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    station.docks_bike(bike)
    bike = station.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike" do
    bike = Bike.new
    docked_bike = station.docks_bike(bike)
    expect(docked_bike).to eq [bike]
  end

  it "returns docked bike" do
    bike = Bike.new
    station.docks_bike(bike)
    expect(station.bikes).to eq [bike]
  end

  it "does not release a bike if there are no bikes available" do
    expect { station.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    bike = Bike.new
    station.docks_bike(bike)
    expect(station.release_bike).to eq bike
  end

  it "does not release a bike if there are no bikes docked" do
    DockingStation::DEFAULT_CAPACITY.times {station.docks_bike Bike.new}
    bike21 = Bike.new
    expect { station.docks_bike(bike21)}.to raise_error('There are no spaces left')
  end
end
