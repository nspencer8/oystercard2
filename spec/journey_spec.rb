
# returning whether or not the journey is complete

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

  it 'returns if a journey is complete' do
    subject.entry_station = station_entry
    subject.exit_station = station_exit
    expect(subject.complete_journey?).to be true
  end

end
