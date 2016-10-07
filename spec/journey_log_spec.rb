require "journey_log"
require "journey"
require "oystercard"

def initialize
  @journey_class
end
describe JourneyLog do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

describe "#journey_log" do
  it "has an empty list of journeys by default" do
    expect(subject.journey_log).to be_empty
  end

  it "stores a journey" do
    subject.top_up
    subject.touch_in
    subject.touch_out
    expect(subject.journey_log.last).to be_a Journey
  end
  end
end
