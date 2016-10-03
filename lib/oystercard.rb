class Oystercard

attr_reader :balance
LIMIT = 90

  def initialize(limit=90, in_journey=false)
    @balance = 0
    @limit = limit
    @in_journey = in_journey
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey
    if touch_in == true
      true
    else
      false
    end
  end

  def touch_in
      true
  end

  def touch_out
    true
  end
end
