#understands the journey - doneish
# starting a journey -doneish
# finishing a journey - doneish
# calculating the fare of a journey
# returning whether or not the journey is complete

require "journey"

describe Journey do

  let(:station_entry) {double :entry_station =>"Aldgate", :zone => 1}
  let(:station_exit) {double :exit_station => "Bank", :zone => 1}


  it 'remembers entry station after touch in' do
    expect(subject.entry_station(station_entry)).to eq station_entry
  end

    it 'remembers exit station after touch out' do
      expect(subject.exit_station(station_exit)).to eq station_exit
    end
end
