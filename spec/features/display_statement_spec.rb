require "account"
require "date"

describe Account do
  it "display bank statement" do
    new_account = Account.new

    datetime_1 = DateTime.new(2012,1,10)
    datetime_2 = DateTime.new(2012,1,13)
    datetime_3 = DateTime.new(2012,1,14)

    allow(DateTime).to receive(:now).and_return(datetime_1)
    new_account.deposit(1000.0)
    allow(DateTime).to receive(:now).and_return(datetime_2)
    new_account.deposit(2000.0)
    allow(DateTime).to receive(:now).and_return(datetime_3)
    new_account.withdraw(500.0)

    expect{new_account.display_transactions}.to output(
      "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
    ).to_stdout
  end
end
