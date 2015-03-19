require_relative 'bike'
class DockingStation
  attr_reader :capacity
  def initialize capacity = 20
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    @bikes.pop
  end

  def dock bike
    fail 'Station Full' if full?
    @bikes << bike
    nil
  end

  private

  attr_reader :bikes

  def full?
    bikes.length == capacity
  end

  def empty?
    bikes.reject(&:broken?).length == 0
  end
end
