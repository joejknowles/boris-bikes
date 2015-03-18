require_relative 'bike'
class DockingStation
  attr_accessor :bike
  alias_method :dock, :bike=
  def initialize
    # @bikes = [Bike.new]
  end

  def release_bike
    fail 'No Bikes Available' unless @bike
    @bike
  end
end
