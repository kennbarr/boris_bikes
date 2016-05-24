class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    empty? ? (raise Exception.new("No bikes left to release")) : @bikes.pop
  end

  def dock (bike)
    full? ? (raise Exception.new("Bike not docked as docking station is already full")) : @bikes << bike
  end

  private
    def full?
      @bikes.length == DEFAULT_CAPACITY ? true : false
    end

    def empty?
      @bikes.length == 0 ? true : false
    end

end

class Bike
  def working?
    true
  end
end
