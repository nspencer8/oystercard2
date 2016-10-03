require 'oystercard'

describe Oystercard do

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
      subject.top_up(limit)
      message = "Balance cannot exceed #{limit}, cannot top up"
      expect{subject.top_up 1 }.to raise_error message
    end
  end

  describe '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'is able to deduct fare from balance' do
      subject.top_up(50)
      expect{subject.deduct 10}.to change{ subject.balance }.by -10
    end
  end

end
