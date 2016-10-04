class Oystercard

attr_reader :balance, :in_journey

LIMIT = 90
MINIMUM_BALANCE = 1
FARE = 1


  def initialize
    @balance = 0
    @limit = 90
    @in_journey = false
    @fare = 1
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  def in_journey?
      false
  end

  def touch_in
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
      @in_journey = true
  end

  def touch_out
    deduct(FARE)
    @in_journey = false
  end

private
def deduct(fare)
  @balance -= fare
end

end
