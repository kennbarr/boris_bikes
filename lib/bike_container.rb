module BikeContainer

  attr_accessor :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def full?
    (@working_bikes.length + @broken_bikes.length) >= @capacity
  end

  private

    def empty?
      (@working_bikes.empty? && @broken_bikes.empty?)
    end

end
