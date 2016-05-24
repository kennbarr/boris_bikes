require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  describe "dock" do
    it "Expects dock method to exist" do
      expect(subject.dock(Bike.new))
    end

    it "Expects a value in dock" do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike)
      expect(station.bikes).to eq [bike]
    end

    it "Raise an exception when trying to dock a bike in a full docking station" do
      station = DockingStation.new
      20.times {station.dock(Bike.new)}
      expect{station.dock(Bike.new)}.to raise_error
    end
  end
  describe "release_bike" do
    it "When attempt to release bike when no bikes left, throw error" do
      expect{subject.release_bike}.to raise_error
    end
  end

  describe "Test cases for full? predicate method" do
    it "If docking station is full, returns true" do
      station = DockingStation.new
      20.times {station.dock(Bike.new)}
      expect(station.full?).to eq true
    end
    it "If docking station is empty, returns false" do
      expect(subject.full?).to eq false
    end
    it "If docking station is not full, returns false" do
      station = DockingStation.new
      19.times {station.dock(Bike.new)}
      expect(station.full?).to eq false
    end
  end

  describe "Test cases for empty? predicate method" do
    it "If docking station is empty, returns true" do
      expect(subject.empty?).to eq true
    end
    it "If docking station is not empty, returns false" do
      station = DockingStation.new
      10.times {station.dock(Bike.new)}
      expect(station.empty?).to eq false
    end
  end

end

describe Bike do
  it "Expects the bike to be working" do
    expect(subject.working?).to eq true
  end
end
