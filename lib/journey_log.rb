require_relative "journey"
require_relative "oystercard"

class JourneyLog

attr_reader :journey_log, :top_up, :touch_in, :touch_out

def initialize
  @journey_log = []
end

def store_journey
  @journey_log << current_journey
end

end
