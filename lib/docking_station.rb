require_relative "bike"

class DockingStation

  attr_reader :bike, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail "There is already a bike docked" if full?
    @bikes << bike
  end

  def release_bike
    fail "No bikes available" if empty? || broken?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

  def broken?
    @bikes.all? { |bike| bike.broken? }
  end

end
