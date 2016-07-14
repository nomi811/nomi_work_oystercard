require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  context 'regarding card' do
    it 'checks to see if the balance is zero' do
      expect(oystercard.balance).to eq 0
    end

    describe '#top_up' do
      it 'checks to see if the card is topped up' do
        expect{ oystercard.top_up 1}.to change{ subject.balance }.by 1
      end
    end
  end

end
