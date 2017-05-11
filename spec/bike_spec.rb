require 'bike'

describe Bike do
  subject(:bike) {Bike.new}
  it { is_expected.to respond_to :working? }

  it "reports broken bike" do
    bike.report_broken
    expect(bike.status).to eq "broken"
  end

  it "checks if bike is reported broken" do
    bike2 = Bike.new
    bike2.report_broken
    expect(bike2.working?).to eq false
  end
end
