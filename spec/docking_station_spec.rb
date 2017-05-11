require 'docking_station'

describe DockingStation do
  subject(:station){ DockingStation.new }

  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = double(:bike)
    station.docks_bike(bike)
    bike = station.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike" do
    bike = double(:bike)
    docked_bike = station.docks_bike(bike)
    expect(docked_bike).to eq [bike]
  end

  it "returns docked bike" do
    bike = double(:bike)
    station.docks_bike(bike)
    expect(station.bikes).to eq [bike]
  end

  it "does not release a bike if there are no bikes available" do
    expect { station.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    bike = double(:bike)
    station.docks_bike(bike)
    expect(station.release_bike).to eq bike
  end

  it "does not release a bike if there are no bikes docked" do
    DockingStation::DEFAULT_CAPACITY.times {station.docks_bike double(:bike)}
    bike21 = double(:bike)
    expect { station.docks_bike(bike21)}.to raise_error('There are no spaces left')
  end

  it "will give default capacity if no parameter is given, else capacity = parameter" do
    station_1 = DockingStation.new
    station_2 = DockingStation.new(40)
    expect(station_1.capacity).to eq 20
    expect(station_2.capacity).to eq 40
  end

  it "only releases a bike if it's working" do
    bike_working = double(:bike)
    bike_broken = double(:bike)
    bike_broken.report_broken

    station.docks_bike(bike_working)
    expect(station.release_bike).to eq bike_working

    station.docks_bike(bike_broken)
    expect {station.release_bike }.to raise_error("Only broken bikes")
  end
end
