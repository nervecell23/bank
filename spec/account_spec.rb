require 'account'

describe Account do

  let(:subject){Account.new}
  it "responds to 'balance' attribute" do
    expect(subject).to have_attributes(:balance => 0)
    # expect(subject.balance).to eq(0)
  end

  describe "#show_balance" do
    it "it displays the balance" do
      expect{subject.show_balance}.to output("Your balance: 0\n").to_stdout
    end
  end

end
