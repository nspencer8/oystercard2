#understands the journey - doneish
# starting a journey -doneish
# finishing a journey - doneish
# calculating the fare of a journey
# returning whether or not the journey is complete

require "journey"

describe Journey do

  let(:entry_station) {double :entry_station =>"Aldgate", :zone => 1}
  let(:exit_station) {double :exit_station => "Bank", :zone => 1}

  it "has an empty list of journeys by default" do
    expect(subject.journey_log).to be_empty
  end

  it 'remembers entry station after touch in' do
    expect(subject.entry_station).to eq "Aldgate"
  end

    it 'remembers exit station after touch out' do
      expect(subject.exit_station).to eq "Bank"
    end

  it 'sets entry station to nil with touch out' do
    # subject.touch_out("Bank")
    expect(subject.touch_out(entry_station)).to eq nil
  end

  describe "#journey_log" do
    let(:journey) { {entry_station: "Bank", exit_station: "Aldgate" }  }
    it "stores a journey" do
      # subject.touch_in("Bank")
      # subject.touch_out("Aldgate")
      expect(subject.journey_log). to include journey
    end
  end


end
