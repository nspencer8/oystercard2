require "journey_log"
require "journey"
require "oystercard"

def initialize
  @journey_class
end
describe JourneyLog do

  let(:complete_journey) {double :complete_journey}
  let(:current_journey) {double :current_journey}

describe "#journey_log" do
  it "has an empty list of journeys by default" do
    expect(subject.journey_log).to be_empty
  end

  it "stores a journey" do
    expect(subject.complete_journey).not_to eq current_journey
  end
  end
end
