#understands the station
require 'station'

describe Station do
  
  let(:entry_station) {double :entry_station == "Aldgate"}
  let(:exit_station) {double (:exit_station == "Bank")}

  subject(:station) {Station.new("Bank", 1)}

  describe "#station_name" do
    it "knows it's name" do
      expect(subject.station_name).to eq("Bank")
    end

    describe "#zone" do
      it "knows it's zone location" do
        expect(subject.zone).to eq 1
      end
    end
  end
end
