require 'docking_station'

describe DockingStation do
  it {subject.release_bike}
end

describe Bike do
  it "Expects the bike to be working" do
    expect(subject.working?).to eq true
  end
end
