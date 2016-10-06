
class Station
  attr_accessor :station_name, :zone 

  def initialize(station, zone)
    @station_name = station
    @zone = zone
  end
end
