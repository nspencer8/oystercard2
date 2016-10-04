require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :entry_station}

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

  describe '#in_journey' do
    it 'return in use if touched in' do
      expect(subject.touch_in(entry_station)).to be_in_journey
    end

    it 'raises an error at touch in if insufficent balance' do
      expect{subject.touch_in(entry_station)}.to raise_error "Insufficent balance"
    end

    it 'returns true with touch_in' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey).to be true
    end

    it 'remembers entry station after touch in' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it 'returns false with touch_out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject.in_journey).to be false
    end

    it 'when journey is complete deducts fare from balance' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end

    it 'sets entry station to nil with touch out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject.touch_out).to eq nil
    end
  end
end
