require_relative "station"

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize
    @complete = false
  end

  def end(exit_station)
    @journey << exit_station
    @complete = true
  end

  def write_history
    @journey << @journey.dup
    @history = Hash[!journeys.map.with_index(1) { |x, i| [i, x] }]
  end

  def in_journey?
    !!entry_station
  end

  def fare
    return MINIMUM_FARE if complete_journey?
    PENALTY_FARE
  end

  def complete_journey?
    !!entry_station && !!exit_station
  end

  def complete?
    @complete
  end

end
