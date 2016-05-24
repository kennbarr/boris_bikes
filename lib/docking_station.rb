class DockingStation
  attr_reader :docked_bikes
  def initialize
    @docked_bikes = []
  end
  def release_bike
    if @docked_bikes == []
      raise Exception.new("No bikes left to release")
    else
      @docked_bikes.pop
    end
  end
  def dock (bike)
    @docked_bikes << bike
  end
end

class Bike
  def working?
    true
  end
end
