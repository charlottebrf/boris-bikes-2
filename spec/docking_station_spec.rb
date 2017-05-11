require 'docking_station'

describe DockingStation do
  subject(:station){ DockingStation.new }
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    allow(bike).to receive(:working?).and_return(true)
    station.docks_bike(bike)
    released_bike = station.release_bike
    expect(released_bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike" do
    docked_bike = station.docks_bike(bike)
    expect(docked_bike).to eq [bike]
  end

  it "returns docked bike" do
    station.docks_bike(bike)
    expect(station.bikes).to eq [bike]
  end

  it "does not release a bike if there are no bikes available" do
    expect { station.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    allow(bike).to receive(:working?).and_return(true)
    station.docks_bike(bike)
    expect(station.release_bike).to eq bike
  end

  it "does not release a bike if there are no bikes docked" do
    DockingStation::DEFAULT_CAPACITY.times {station.docks_bike bike}

    expect { station.docks_bike(bike)}.to raise_error('There are no spaces left')
  end

  it "will give default capacity if no parameter is given, else capacity = parameter" do
    station_1 = DockingStation.new
    station_2 = DockingStation.new(40)
    expect(station_1.capacity).to eq 20
    expect(station_2.capacity).to eq 40
  end

  it "only releases a bike if it's working" do
    allow(bike).to receive(:report_broken).and_return(bike)

    bike_working = bike
    allow(bike_working).to receive(:working?).and_return(true)
    station.docks_bike(bike_working)
    expect(station.release_bike).to eq bike_working

    bike_broken = bike
    bike_broken.report_broken
    allow(bike_broken).to receive(:working?).and_return(false)
    station.docks_bike(bike_broken)
    expect {station.release_bike }.to raise_error("Only broken bikes")
  end
end
