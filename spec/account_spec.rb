require 'account'

describe Account do

  let(:subject){Account.new(1000)}
  it "responds to 'balance' attribute" do
    expect(subject).to have_attributes(:balance => 1000)
    # expect(subject.balance).to eq(0)
  end

  it "can be added a initial balance when created" do
    expect(subject.balance).to eq(1000)
  end

  describe "#show_balance" do
    it "it displays the balance" do
      expect{subject.show_balance}.to output("Your balance: 1000\n").to_stdout
    end
  end

  describe "#withdraw" do
    it "deducts the amount from balance" do
      subject.withdraw(500)
      expect(subject.balance).to eq(500)
    end

    it "does not proceed in case of not enough balance and show error notice" do
      expect{subject.withdraw(1001)}.to output("Not enough balance\n").to_stdout
      expect(subject.balance).to eq(1000)
    end

    it "does not allow withdrawing negative amount and show error notice" do
      expect{subject.withdraw(-1)}.to output("Can not withdraw negative amount\n").to_stdout
    end
  end

  describe "#deposit" do
    it "add specified amount to balance" do
      subject.deposit(200)
      expect(subject.balance).to eq(1200)
    end
  end

end
