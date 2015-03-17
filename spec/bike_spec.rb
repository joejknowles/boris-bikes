require_relative '../lib/bike.rb'
describe Bike do
  it { is_expected.to respond_to :broken? }
end
