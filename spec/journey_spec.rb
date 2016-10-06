require "journey"

describe Journey do

  let(:station_entry) {double :entry_station =>"Aldgate", :zone => 1}
  let(:station_exit) {double :exit_station => "Bank", :zone => 1}

  it 'remembers entry station after touch in' do
    subject.entry_station = station_entry
    expect(subject.entry_station).to eq station_entry
  end

  it 'remembers exit station after touch out' do
    subject.exit_station = station_exit
    expect(subject.exit_station).to eq station_exit
  end

  it 'returns the minimun fare' do
    subject.entry_station = station_entry
    subject.exit_station = station_exit
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it 'returns the penalty fare' do
    subject.entry_station = station_entry
    subject.exit_station = nil
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  context '#complete_journey' do
  it 'returns true if a journey is complete' do
    subject.entry_station = station_entry
    subject.exit_station = station_exit
    expect(subject.complete_journey?).to be true
  end

  it 'returns false if a journey has no exit station' do
    subject.entry_station = station_entry
    expect(subject.complete_journey?).to be false
  end

  it 'returns false if a journey has no entry station' do
    subject.exit_station = station_exit
    expect(subject.complete_journey?).to be false
  end
end


end
