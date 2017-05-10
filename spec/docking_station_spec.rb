require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :docks_bike }

  it "docks bike" do
    bike = subject.release_bike
    docked_bike = subject.docks_bike(bike)
    expect(docked_bike).to eq bike
  end

  it "returns docked bike" do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.bike).to eq bike
  end
end
