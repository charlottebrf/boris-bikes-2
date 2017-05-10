require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    subject.docks_bike(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike" do
    bike = Bike.new
    docked_bike = subject.docks_bike(bike)
    expect(docked_bike).to eq bike
  end

  it "returns docked bike" do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.bike).to eq bike
  end

  it "does not release a bike if there are no bikes available" do
    expect { subject.release_bike }.to raise_error("Sorry there are no bikes")
  end

  it "releases same bike as docked" do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it "does not release a bike if there are no bikes docked" do
    bike = Bike.new
    subject.docks_bike(bike)
    bike2 = Bike.new
    expect { subject.docks_bike(bike2)}.to raise_error('There are no spaces left')
  end
end
