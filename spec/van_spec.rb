require "van"

describe Van do
  describe "#take_broken" do
    it "Responds to take_broken" do
      expect(subject).to respond_to(:take_broken)
    end

    it "Takes broken bikes from a station" do
      bike1 = double("bike1", :working? => true)
      bike2 = double("bike2", :working? => false)
      station = double("station", :working_bikes => [bike1],:broken_bikes => [bike2])
      van = Van.new
      van.take_broken(station)
      expect(van.broken_bikes).to eq [bike2]
      expect(station.broken_bikes).to eq []
      expect(station.working_bikes).to eq [bike1]
    end

    it "Stops taking broken bikes once capacity is reached" do
      van = Van.new(3)
      van.broken_bikes = ["dummy bike"]
      bike1 = double("bike1", :working? => false)
      bike2 = double("bike2", :working? => false)
      bike3 = double("bike3", :working? => false)
      station = double("station", :broken_bikes => [bike1, bike2, bike3])
      van.take_broken(station)
      expect(van.broken_bikes[1]).to eq bike3
      expect(station.broken_bikes).to eq [bike1]
    end

  end

  describe "#deliver_broken" do
    it "Responds to deliver_broken" do
      expect(subject).to respond_to(:deliver_broken)
    end
    it "Delivers broken bikes to garage" do
      van = Van.new
      van.broken_bikes = ["dummy1","dummy2"]
      garage = double("garage", :broken_bikes => [], :capacity => 10, :full? => false)
      van.deliver_broken(garage)
      expect(van.broken_bikes).to eq []
      expect(garage.broken_bikes).to eq ["dummy2","dummy1"]
    end
  end

  describe "#take_working" do
    it "Collects working bikes from the garage" do
      garage = double("garage", :working_bikes => ["dummy1","dummy2"])
      van = Van.new
      van.take_working(garage)
      expect(van.working_bikes).to eq ["dummy2","dummy1"]
    end
  end

  describe "#deliver_working" do
    it "Delivers working bikes to a station" do
      station = double("station", :working_bikes => [], :capacity => 20, :full? => false)
      van = Van.new
      van.working_bikes = ["dummy1","dummy2"]
      van.deliver_working(station)
      expect(station.working_bikes).to eq ["dummy2","dummy1"]
      expect(van.working_bikes).to eq []
    end
  end

end
