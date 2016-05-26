require_relative 'bike'

class DockingStation
  attr_accessor :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :working_bikes, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    return working_bikes.pop if @working_bikes != []
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
