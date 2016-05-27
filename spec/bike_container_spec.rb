require 'docking_station'
require 'garage'
require 'van'

shared_examples_for "Bike Storers" do
  let(:storage_default) {described_class.new}
  let(:storage_custom) {described_class.new(15)}

  context "Initialized with default capacity" do
    it "Initializes with 20 bike spaces" do
      expect(storage_default.capacity).to eq(20)
    end
  end

  context "Initialized with custom capacity" do
    it "Initializes with 15 bike spaces" do
      expect(storage_custom.capacity).to eq(15)
    end
  end
end

describe DockingStation do
  it_behaves_like "Bike Storers"
end

describe Garage do
  it_behaves_like "Bike Storers"
end

describe Van do
  it_behaves_like "Bike Storers"
end
