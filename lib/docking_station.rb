require_relative "bike"

class DockingStation

  attr_reader :bike, :capacity

  def dock(bike)
    fail "There is already a bike docked" if @bike
    @bike = bike
  end

  def release_bike
    fail "No bikes available" unless @bike
    @bike
  end

end
