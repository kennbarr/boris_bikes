class Van
  attr_accessor :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def take_broken(station, max = @capacity-(@working_bikes.length+@broken_bikes.length))
    #optional "max" argument to allow ability to only take a certain number of broken_bikes
    #to better allow balancing of capacity across several stations
    while (!station.broken_bikes.empty? && max > 0 && !full?)
      @broken_bikes << station.broken_bikes.pop
      max -=1
    end
  end

  def deliver_broken(garage, max = @broken_bikes.length)
    while (!garage.full? && max > 0 && !@broken_bikes.empty?)
      garage.broken_bikes << @broken_bikes.pop
      max -=1
    end
  end

  def take_working(garage, max = @capacity-(@working_bikes.length+@broken_bikes.length))
    while (!garage.working_bikes.empty? && max > 0 && !full?)
      @working_bikes << garage.working_bikes.pop
      max -=1
    end
  end

  def deliver_working(station, max = @working_bikes.length)
    while (!station.full? && max > 0 && !@working_bikes.empty?)
      station.working_bikes << @working_bikes.pop
      max -=1
    end
  end

  private
    def full?
      @capacity <= (@working_bikes.length+@broken_bikes.length)
    end
end
