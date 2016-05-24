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
  describe "initialize docking station" do
    it "allows you to initialize docking station with custom capacity" do
      expect(DockingStation.new(15).capacity).to eq(15)
    end
    it "allows you to initialize docking station with default capacity" do
      expect(DockingStation.new.capacity).to eq(20)
    end
  end

end


describe Bike do
  it "Expects the bike to be working" do
    expect(subject.working?).to eq true
  end
end
