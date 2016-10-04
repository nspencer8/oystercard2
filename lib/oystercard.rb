class Oystercard

attr_reader :balance, :entry_station, :exit_station #:journeys

LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @limit = MINIMUM_BALANCE
    @in_journey = false
    #@journeys = []
  end

  def in_journey?
    !!entry_station
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @entry_station = nil
  end

private
def deduct(fare)
  @balance -= fare
end

end
