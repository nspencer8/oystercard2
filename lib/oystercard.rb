class Oystercard

attr_reader :balance
LIMIT = 90

  def initialize(limit=90)
    @balance = 0
    @limit = limit
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
    @balance += amount
  end

end
