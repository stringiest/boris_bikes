require_relative "./bike"

class DockingStation

  attr_reader :bike_store

  def initialize
    @bike_store = []
  end

  def release_bike
    if @bike_store.empty?
      raise StandardError.new "There were no bikes in the docking station"
    else
      Bike.new
    end
  end

  def dock(bike)
    @bike_store.push(bike)
  end
end
