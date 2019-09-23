require_relative "./transaction"
require "date"

class Account
  attr_reader :balance

  DEFAULT_BALANCE = 0;

  def initialize(initial_balance = DEFAULT_BALANCE, transaction_class = Transaction)
    @balance = initial_balance
    @transaction_list = []
    @transaction_class = transaction_class
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

  def deposit(amount)
    if is_negative?(amount)
      puts "Can not deposit negative amount"
      return
    end

    @balance += amount

    #store the transaction
    transaction = @transaction_class.new(DateTime.now.to_date, amount, 0, @balance)
    @transaction_list.push(transaction)
  end

  private
  def enough_balance?(amount)
    (amount <= @balance)? true : false
  end

  def is_negative?(amount)
    (amount < 0)? true : false
  end
end
