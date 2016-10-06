require_relative "station"

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station

  def in_journey?
    !!entry_station
  end

  def fare
    return MINIMUM_FARE if entry_station && exit_station
    PENALTY_FARE
  end

end
