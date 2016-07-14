require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  context 'regarding card' do
    #it { is_expected.to respond_to :balance }
    it 'checks to see if the balance is zero' do
      expect(oystercard.balance).to eq 0
    end
  end

end
