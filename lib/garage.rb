require_relative 'bike_container'

class Garage
  include BikeContainer

  def fix_bikes
    @broken_bikes.each {|bike| bike.fix; @working_bikes << bike }
    @broken_bikes = []
  end

  def full?
    @capacity <= (@working_bikes.length + @broken_bikes.length)
  end

end
