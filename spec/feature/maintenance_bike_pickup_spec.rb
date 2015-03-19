require 'capybara/rspec'
# require 'van'
require 'docking_station'
require 'bike'

feature 'van picks up' do
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

  scenario 'all broken bikes' do
    docking_station.release_broken
    expect(docking_station.bikes).to be_none(&:broken?)
  end

  scenario 'only broken bikes' do
  end
end
