require_relative "station"

class Journey

attr_accessor :entry_station, :exit_station

      def in_journey?
        !!entry_station
      end
end
