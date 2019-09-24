# frozen_string_literal: true

require_relative './transaction'
require 'date'

class Account
  attr_reader :balance

  DEFAULT_BALANCE = 0.0

  def initialize(initial_balance = DEFAULT_BALANCE, transaction_class = Transaction)
    @balance = initial_balance
    @transaction_list = []
    @transaction_class = transaction_class
  end

  def show_balance
    puts "Your balance: #{format('%.2f', @balance)}"
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
    create_transaction(nil, amount)
  end

  def deposit(amount)
    if amount.negative?
      puts 'Can not deposit negative amount'
      return
    end

    @balance += amount
    create_transaction(amount, nil)
  end

  def display_transactions
    if @transaction_list.empty?
      puts 'There is no transaction'
      return
    end

    iterate_transactions
  end

  private

  def iterate_transactions
    puts 'date || credit || debit || balance'

    @transaction_list.reverse_each do |transaction|
      puts "#{transaction.transaction_date.strftime('%d/%m/%Y')} || "\
            "#{formatter(transaction.credit)}|| #{formatter(transaction.debit)}|| "\
            "#{format('%.2f', transaction.balance)}"
    end
  end

  def enough_balance?(amount)
    amount <= @balance
  end

  def create_transaction(credit, debit)
    date_now = DateTime.now
    @transaction_list.push(@transaction_class.new(date_now, credit, debit, @balance))
  end

  # add a space after credit or debit if it is not nil
  def formatter(attribute)
    return format('%.2f', attribute) + ' ' unless attribute.nil?
  end
end
