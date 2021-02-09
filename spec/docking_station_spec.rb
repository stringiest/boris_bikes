require "docking_station"
require "bike"

describe DockingStation do
  # uses a # before the method name to imply that it's an instance
  describe "#release_bike" do

    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when there are no bikes available" do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it 'does not release a broken bike' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe "#working?" do
 
    it 'releases working bikes' do
      bike = double(:bike, broken?: false, working?: true)
      subject.dock bike
      expect(subject.release_bike).to be bike
    end
  end

  describe "dock" do
    # test to check that you can dock a bike
    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

    it "docks something" do
      bike = double(:bike)
      # we want to return the bike we dock
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'docks a broken bike' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      expect(subject.dock(bike)).to eq [bike]
    end

    it "raises an error when trying to dock a bike to full station" do
      subject.capacity.times { subject.dock double(:bike) }
      expect {subject.dock double(:bike) }.to raise_error "There is already a bike docked"
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike) }
      expect{ docking_station.dock double(:bike) }.to raise_error 'There is already a bike docked'
    end

    subject { DockingStation.new }
    let(:bike) { double :bike }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
    expect{ subject.dock(bike) }.to raise_error 'There is already a bike docked'
  end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
