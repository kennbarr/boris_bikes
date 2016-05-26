require 'docking_station'

describe DockingStation do
  let(:bike) {double :bike}
  let(:bike2) {double :bike2}

  describe "#initialize" do
    it "Should be able to set custom station capacity" do
      expect(DockingStation.new(30).capacity).to eq 30
    end
  end

  describe "#dock" do

    it "Should respond to dock" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "Should raise an error if we try to dock in a full docking station" do
      bike = double("bike", :working? => true)
      subject.capacity.times {subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error "The docking station is full"
    end

  end

  describe "#release_bike" do

    it "Should respond to release bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "Should raise an error if no bikes are available" do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end

    it "Should not release a bike if it's broken" do
      station = DockingStation.new
      bike = double("bike", :working? => false)
      station.dock(bike)
      expect{station.release_bike}.to raise_error("No bikes available")
    end

    it "Should release the next working bike" do
      station = DockingStation.new
      bike1 = double("bike1", :working? => true)
      bike2 = double("bike2", :working? => false)
      station.dock(bike1)
      station.dock(bike2)
      expect(station.release_bike).to eq bike1
    end
  end

end
