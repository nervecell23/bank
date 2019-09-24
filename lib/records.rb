class Records

  def initialize(transaction_class = Transaction)
    @transaction_list = []
    @transaction_class = transaction_class
  end

  def create_transaction(date_now, credit, debit, balance)
    @transaction_list.push(@transaction_class.new(date_now, credit, debit, balance))
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

  # add a space after credit or debit if it is not nil
  def formatter(attribute)
    return format('%.2f', attribute) + ' ' unless attribute.nil?
  end

end
