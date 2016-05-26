class Garage
  attr_accessor :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def fix_bikes
    @broken_bikes.each {|bike| bike.fix; @working_bikes << bike }
    @broken_bikes = []
  end

  def full?
    @capacity <= @working_bikes + @broken_bikes
  end

end
