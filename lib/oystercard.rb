require_relative "station"
require_relative "journey"

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :current_journey, :in_journey

  MAX_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_log = []                               # needs to be removed
    @current_journey = Journey.new
  end

  def top_up(amount)
    fail "Balance cannot exceed #{MAX_BALANCE}, cannot top up" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    finish_journey if !current_journey.in_journey?
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
    current_journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    current_journey.exit_station = exit_station
    finish_journey
  end


  private
  def deduct(fare)
    @balance -= fare
  end

  def finish_journey
    deduct(current_journey.fare)
    store_journey                        #change to new journey_log class
    @current_journey = Journey.new
  end
end
