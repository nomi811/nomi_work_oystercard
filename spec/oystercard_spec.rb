require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  max_balance = Oystercard::MAX_BALANCE
  min_fare = Oystercard::MIN_FARE


  context 'when card is out of money' do
    describe 'checks balance' do
      it 'checks to see if the balance is zero' do
        expect(card.balance).to eq 0
      end
    end

    describe '#top_up' do
      it 'checks to see if the card is topped up' do
        expect{ card.top_up(min_fare)}.to change{ card.balance }.by min_fare
      end
  end
  context 'when card has money' do
      before(:each){card.top_up(max_balance)}
      before(:each){card.touch_in}
      it 'raises an error if top_up exceeds maximum balance' do
        expect{ card.top_up(min_fare)}.to raise_error 'maximum balance exceeded'
      end
    end

    describe 'charges fare on touch out' do
      it 'checks to see the balance is deducted on touch out' do
        expect{ card.touch_out }.to change{ card.balance }.by -min_fare
      end
    end
  end

  context 'regarding journey' do

    describe 'checks to see if the card is in journey or not' do
      it 'is initially not in a journey' do
        expect(card).not_to be_in_journey
      end
    end

    describe 'insufficient funds' do
      it 'raises and error on touch in' do
        #@in_use = false
        expect{ card.touch_in }.to raise_error 'insufficient funds'
      end
    end
  end

end
