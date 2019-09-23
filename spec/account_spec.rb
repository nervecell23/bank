require "account"
require "date"

describe Account do

  let(:subject){Account.new(1000.0)}
  it "responds to 'balance' attribute" do
    expect(subject).to have_attributes(:balance => 1000.0)
    # expect(subject.balance).to eq(0)
  end

  it "can be added an initial balance when created" do
    expect(subject.balance).to eq(1000.0)
  end

  describe "#show_balance" do
    it "it displays the balance" do
      expect{subject.show_balance}.to output("Your balance: 1000.00\n").to_stdout
    end
  end

  describe "#withdraw" do
    it "deducts the amount from balance" do
      subject.withdraw(500.0)
      expect(subject.balance).to eq(500.0)
    end

    it "does not proceed in case of not enough balance and show error notice" do
      expect{subject.withdraw(1001.0)}.to output("Not enough balance\n").to_stdout
      expect(subject.balance).to eq(1000.0)
    end

    it "does not allow withdrawing negative amount and show error notice" do
      expect{subject.withdraw(-1.0)}.to output("Can not withdraw negative amount\n").to_stdout
      expect(subject.balance).to eq(1000.0)
    end
  end

  describe "#deposit" do
    it "add specified amount to balance" do
      subject.deposit(200.0)
      expect(subject.balance).to eq(1200.0)
    end

    it "does not allow deposit of negative amount and show error notice" do
      expect{subject.deposit(-1.0)}.to output("Can not deposit negative amount\n").to_stdout
      expect(subject.balance).to eq(1000.0)
    end
  end

  describe "#create_transaction" do
    let(:transaction_class_double){double("transaction_class")}
    let(:transaction_inst_double){double("transaction_inst")}
    let(:new_account){Account.new(1000.0, transaction_class_double)}
    let(:datetime){DateTime.now}

    it "creates transaction instance for deposit" do
      expect(transaction_class_double).to receive(:new).with(datetime, 500.0, nil, 1500.0).
        and_return(transaction_inst_double)

      new_account.deposit(500.0)
    end

    it "create transaction instance for withdraw" do
      expect(transaction_class_double).to receive(:new).with(datetime, nil, 450.0, 550.0).
        and_return(transaction_inst_double)

      new_account.withdraw(450.0)
    end
  end

  describe "#display_transactions" do
    it "display error notice when there is no transaction" do
      expect{subject.display_transactions}.to output("There is no transaction\n").to_stdout
    end
  end

end
