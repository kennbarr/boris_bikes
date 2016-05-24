class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
    @limit = 20
  end

  def release_bike
    empty? ? (raise Exception.new("No bikes left to release")) : @bikes.pop
  end

  def dock (bike)
    full? ? (raise Exception.new("Bike not docked as docking station is already full")) : @bikes << bike
  end

  private
    def full?
      @bikes.length == @limit ? true : false
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
