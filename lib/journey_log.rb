require_relative "journey"
require_relative "oystercard"

class JourneyLog

attr_accessor :journey_log, :complete_journey, :current_journey


def initialize
  @journey_log = []
  @current_journey = Journey.new
end

def store_journey
  @journey_log << current_journey
end

end
