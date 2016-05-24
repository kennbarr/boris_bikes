class DockingStation
  attr_reader :docked_bike
  def initialize
    @docked_bike
  end
  def release_bike
    Bike.new
  end
  def dock (bike)
    @docked_bike = bike
  end
end

class Bike
  def working?
    true
  end
end
