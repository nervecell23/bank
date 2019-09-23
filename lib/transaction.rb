class Transaction

  attr_reader :transaction_date, :credit, :debit, :balance

  def initialize(transaction_date, credit, debit, balance)
    @transaction_date = transaction_date
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
