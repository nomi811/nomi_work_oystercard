require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  max_balance = Oystercard::MAX_BALANCE
  min_fare = Oystercard::MIN_FARE

  context 'regarding card' do
    describe 'checks balance' do
      it 'checks to see if the balance is zero' do
        expect(card.balance).to eq 0
      end
    end

    describe '#top_up' do
      it 'checks to see if the card is topped up' do
        expect{ card.top_up(min_fare)}.to change{ card.balance }.by min_fare
      end
      it 'raises an error if top_up exceeds maximum balance' do
        card.top_up(max_balance)
        expect{ card.top_up(min_fare)}.to raise_error 'maximum balance exceeded'
      end
    end

    describe 'deduct fare' do
      it 'checks to see if the fare is deducted' do
        card.top_up(max_balance)
        expect{ card.deduct(min_fare) }.to change{ card.balance }.by -min_fare
      end
    end
  end

end
