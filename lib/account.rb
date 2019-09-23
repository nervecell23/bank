class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def show_balance
    puts "Your balance: #{@balance}"
  end
end
