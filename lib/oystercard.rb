class Oystercard

attr_reader :balance, :in_journey
LIMIT = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @limit = 90
    @in_journey = false
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  # def minimum_balance
  #   fail "Insufficent balance" if balance < MINIMUM_BALANCE
  # end

  def in_journey?
      false
  end

  def touch_in
    fail "Insufficent balance" if balance < MINIMUM_BALANCE
      @in_journey = true
  end


  def touch_out
    @in_journey = false
  end
end
