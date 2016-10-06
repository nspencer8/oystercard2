require_relative "station"
require_relative "journey"

class Oystercard

  attr_reader :balance, :exit_station, :journey_log, :current_journey

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @limit = MINIMUM_BALANCE
    @journey_log = []
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
     @current_journey = Journey.new
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
    current_journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    current_journey.exit_station = exit_station
    store_journey
    @current_journey = nil
  end

  def store_journey
    @journey_log << @current_journey
  end

  private
  def deduct(fare)
    @balance -= fare
  end
end
