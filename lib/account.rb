class Account
  attr_reader :balance

  INITIAL_BALANCE = 0;

  def initialize(initial_balance = INITIAL_BALANCE)
    @balance = initial_balance
  end

  def show_balance
    puts "Your balance: #{@balance}"
  end
end
