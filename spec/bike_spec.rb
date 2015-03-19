require_relative '../lib/bike.rb'
describe Bike do
  context 'when created' do
    it { is_expected.to_not be_broken }
  end
  it 'can break' do
    subject.break
    expect(subject).to be_broken
  end
end
