# frozen_string_literal: true

require_relative './transaction'
require_relative './records'
require 'date'

class Account
  DEFAULT_BALANCE = 0.0

  def initialize(initial_balance = DEFAULT_BALANCE, records = Records.new)
    @balance = initial_balance
    @records = records
  end

  def withdraw(amount)
    unless enough_balance?(amount)
      puts 'Not enough balance'
      return
    end

    if amount.negative?
      puts 'Can not withdraw negative amount'
      return
    end

    @balance -= amount
    @records.create_transaction(DateTime.now, nil, amount, @balance)
  end

  def deposit(amount)
    if amount.negative?
      puts 'Can not deposit negative amount'
      return
    end

    @balance += amount
    @records.create_transaction(DateTime.now, amount, nil, @balance)
  end

  def display_transactions
    @records.display_transactions
  end

  private

  def enough_balance?(amount)
    amount <= @balance
  end
end
