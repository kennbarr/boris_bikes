require "bike"

describe Bike do
  describe "#working?" do
    it "Should respond to working?" do
      expect(subject).to respond_to(:working?)
    end
  end

  describe "#broken" do
    it "Should respond to broken" do
      expect(subject).to respond_to(:broken)
    end
    it "Should not be working if reported broken" do
      bike = Bike.new
      bike.broken
      expect(bike.working?).to eq false
    end
  end

  describe "#fixed" do
    it "Should fix a broken bike" do
      bike = Bike.new
      bike.broken
      bike.fix
      expect(bike.working?).to eq true
    end
  end
end
