require 'capybara/rspec'
# require 'van'
require 'docking_station'
require 'bike'
require 'van'
require 'garage'

feature 'maintenance can' do
  let(:docking_station) do
    station = DockingStation.new
    3.times do
      station.dock Bike.new
      to_be_broken = Bike.new
      to_be_broken.break
      station.dock to_be_broken
    end
    station
  end
  let(:van) { Van.new }
  let(:garage) { Garage.new }

  scenario 'remove broken bikes from dock' do
    docking_station.release_broken
    expect(docking_station.bikes).to be_none(&:broken?)
  end

  scenario 'receive only broken bikes from dock' do
    expect(docking_station.release_broken).to be_all(&:broken?)
  end

  scenario 'dock broken bikes into van' do
    docking_station.release_broken.each { |bike| van.dock(bike) }
    expect(van.bike_count).to be 3
    expect(van.bikes).to be_all(&:broken?)
  end

  scenario 'release all bikes from van' do
    docking_station.release_broken.each { |bike| van.dock(bike) }
    van.release_all
    expect(van.bike_count).to be 0
  end

  scenario 'dock bikes in garage and fix them' do
    docking_station.release_broken.each { |bike| garage.dock(bike) }
    expect(garage.bike_count).to be 3
    expect(garage.bikes).to be_all(&:broken?)
    garage.fix_bikes
    expect(garage.bike_count).to be 3
    expect(garage.bikes).to be_none(&:broken?)
  end
end
