require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  it { is_expected.to respond_to :balance }

  it 'takes a new card and checks it has a balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'is able to top up balance' do
      expect{subject.top_up 1}.to change{ subject.balance }.by 1
    end

    it 'raises an error if the balance amount exceeds £90' do
      limit = Oystercard::LIMIT
      subject.top_up(90)
      message = "Balance cannot exceed #{limit}, cannot top up"
      expect{subject.top_up 1 }.to raise_error message
    end
  end

  describe '#touch_in' do

    it 'raises an error at touch in if insufficent balance' do
      expect{subject.touch_in(entry_station)}.to raise_error "Insufficent balance"
    end

    it 'remembers entry station after touch in' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  describe '#touch_out' do

    it 'when journey is complete deducts fare from balance' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end

    it 'sets entry station to nil with touch out' do
      subject.top_up(10)
      subject.touch_out(exit_station)
      expect(subject.touch_out(entry_station)).to eq nil
    end

    it 'remembers exit station after touch out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end
end
