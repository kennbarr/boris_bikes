class DockingStation
  attr_reader :docked_bikes
  def initialize
    @docked_bikes = []
    @limit = 1
  end
  def release_bike
    if @docked_bikes == []
      raise Exception.new("No bikes left to release")
    else
      @docked_bikes.pop
    end
  end
  def dock (bike)
    if (@docked_bikes.length == @limit)
      raise Exception.new("Bike not docked as docking station is already full")
    else
      @docked_bikes << bike
    end
  end
end

class Bike
  def working?
    true
  end
end
