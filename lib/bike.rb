class Bike

  def initialize
    @working = true
  end

  def broken
    @working = false
  end

  def fix
    @working = true
  end

  def working?
    @working
  end
end
