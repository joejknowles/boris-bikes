feature 'member of public docks bike' do
  scenario 'docking station unable to receive as full' do
    docking_station = DockingStation.new
    docking_station.capacity.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end
