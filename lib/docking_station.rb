class DockingStation
  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    @bikes.shift
  end
end
