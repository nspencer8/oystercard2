class Oystercard

attr_reader :balance, :in_journey, :entry_station

LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @limit = MINIMUM_BALANCE
    #@in_journey = false
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  # def in_journey?
  #     false
  # end

  def touch_in(entry_station)
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
  end

private
def deduct(fare)
  @balance -= fare
end

end
