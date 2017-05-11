require 'bike'

describe Bike do
  subject(:bike) {Bike.new}
  it { is_expected.to respond_to :working? }

  it "reports broken bike" do
    expect(bike.report_broken).to eq "broken"
  end
end
