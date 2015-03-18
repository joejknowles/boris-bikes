require_relative '../lib/bike.rb'
describe Bike do
  it { is_expected.to respond_to :broken? }
  context 'when created' do
    it { is_expected.to_not be_broken }
  end
end
