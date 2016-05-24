require 'docking_station'

describe DockingStation do
  it {subject.release_bike}
  describe "dock" do
    it "expects dock method to exist" do

      expect(subject.dock(Bike.new))
    end

  it "expects a value in doc" do
    station = DockingStation.new
    testbike = station.release_bike
    station.dock(testbike)
    expect(station.docked_bike).to eq testbike
  end

  end
end

describe Bike do
  it "Expects the bike to be working" do
    expect(subject.working?).to eq true
  end
end
