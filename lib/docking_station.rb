require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer
  @bikes = []
  def release_bike
    return working_bikes.pop if !@working_bikes.empty?
    fail "No bikes available"
  end

  def dock bike
    fail "The docking station is full" if full?
    bike.working? ? @working_bikes << bike : @broken_bikes << bike
  end

end
