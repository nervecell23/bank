class Account
  attr_reader :balance

  INITIAL_BALANCE = 0;

  def initialize(initial_balance = INITIAL_BALANCE)
    @balance = initial_balance
  end

  def show_balance
    puts "Your balance: #{@balance}"
  end

  def withdraw(amount)
    if !enough_balance?(amount)
      puts "Not enough balance"
      return
    end

    if is_negative?(amount)
      puts "Can not withdraw negative amount"
      return
    end
    
    @balance -= amount
  end

  private
  def enough_balance?(amount)
    (amount <= @balance)? true : false
  end

  def is_negative?(amount)
    (amount < 0)? true : false
  end
end
