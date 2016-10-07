require_relative "station"
require_relative "journey"

class Oystercard

attr_reader :balance, :entry_station, :exit_station, :journey_log, :journey

LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

    def initialize
      @balance = 0
      @limit = MINIMUM_BALANCE
    end

    def top_up(amount)
      fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
      @balance += amount
    end

    def touch_in
       @journey = Journey.new
      fail "Insufficent balance" if balance < MINIMUM_BALANCE
      @entry_station = entry_station
    end

    def touch_out(exit_station) #stay but need to link with Station
      @exit_station = exit_station
      deduct(MINIMUM_FARE)
      journey
      @entry_station = nil
    end


  private
  def deduct(fare)
    @balance -= fare
  end
end
