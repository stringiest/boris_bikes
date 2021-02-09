require_relative "bike"

class DockingStation

  attr_reader :bike, :capacity

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "There is already a bike docked" if full?
    @bikes << bike
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end
