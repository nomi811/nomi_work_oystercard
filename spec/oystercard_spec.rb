require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  maximum_balance = Oystercard::MAX_BALANCE
  min_fare = Oystercard::MIN_FARE

  context 'regarding card' do
    it 'checks to see if the balance is zero' do
      expect(oystercard.balance).to eq 0
    end

    describe '#top_up' do
      it 'checks to see if the card is topped up' do
        expect{ oystercard.top_up(1)}.to change{ subject.balance }.by 1
      end
      it 'raises an error if top_up exceeds maximum balance' do
        oystercard.top_up(maximum_balance)
        expect{ oystercard.top_up(min_fare)}.to raise_error 'maximum balance exceeded'
      end
    end
  end

end
