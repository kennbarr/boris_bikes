require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    return working_bikes.pop if !@working_bikes.empty?
    fail "No bikes available"
  end

  def dock bike
    fail "The docking station is full" if full?
    bike.working? ? @working_bikes << bike : @broken_bikes << bike
  end

  def full?
    (@working_bikes.length + @broken_bikes.length) >= @capacity
  end

  private

    def empty?
      (@working_bikes.empty? && @broken_bikes.empty?)
    end

end
