require_relative "station"

class Journey

attr_reader :journey_log

  def initialize
    @journey_log = []
  end


      def in_journey?
        !!entry_station
      end

      def journey
        @journey_log << { entry_station: entry_station, exit_station: exit_station }
      end

end
