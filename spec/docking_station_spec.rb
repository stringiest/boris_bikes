require "docking_station"
require "bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "releases working bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  # test to check that you can dock a bike
  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "docks something" do
    bike = Bike.new
    # we want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    # Again, we need to return the bike we just docked
    expect(subject.bike).to eq bike
  end

  it "doesn't return bike if there aren't any" do
    @available_bikes = 0
    expect{subject.release_bike}.to raise_error
  end

  # it "index 0 in bike storage is not nil after bike being docked" do
  #   station = DockingStation.new
  #   bike = Bike.new
  #   station.dock(bike)
  #   expect(station.bike_store[0]).to_not eq nil
  # end

  # it "returns error if trying to release bike from empty docking station" do
  #   expect{DockingStation.new.release_bike}.to raise_error
  # end
end
