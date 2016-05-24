class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
    @limit = 20
  end

  def release_bike
    if @bikes == []
      raise Exception.new("No bikes left to release")
    else
      @bikes.pop
    end
  end

  def dock (bike)
    if (@bikes.length == @limit)
      raise Exception.new("Bike not docked as docking station is already full")
    else
      @bikes << bike
    end
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
