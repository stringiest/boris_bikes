require_relative "bike"

class DockingStation

  attr_reader :bike

  def release_bike
    fail "No bikes available" unless @bike
    @bike
  end

  def dock(bike)
    # we need to return the bike we dock
    @bike = bike
  end

end
