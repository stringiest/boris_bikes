require_relative "bike"

class DockingStation

  attr_reader :bike

  def initialize
    @available_bikes = 0
  end

  def release_bike
    if @available_bikes == 0
      raise StandardError.new "There were no bikes in the docking station"
    else
      Bike.new
    end
  end

  def dock(bike)
    # we need to return the bike we dock
    @bike = bike
    # @bike_store.push(bike) # needed for step 12
  end

end
