require 'account'

describe Account do

  let(:subject){Account.new}
  it "responds to 'balance' attribute" do
    expect(subject).to have_attributes(:balance => 0)
    # expect(subject.balance).to eq(0)
  end

  it "can be added a initial balance when created" do
    new_subject = Account.new(1000)
    expect(new_subject.balance).to eq(1000)
  end

  describe "#show_balance" do
    it "it displays the balance" do
      expect{subject.show_balance}.to output("Your balance: 0\n").to_stdout
    end
  end

  describe "#withdraw" do
    it "deducts the amount from balance" do
      subject = Account.new(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq(500)
    end
  end

end
