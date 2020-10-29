require "docking_station"
require "bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "creates a new, working, instance of bike if dock isn't empty" do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock) }

  it "index 0 in bike storage is not nil after bike being docked" do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.bike_store[0]).to_not eq nil
  end

  it "returns error if trying to release bike from empty docking station" do
    expect{DockingStation.new.release_bike}.to raise_error
  end
end
