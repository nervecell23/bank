require 'account'

describe Account do

  let(:subject){Account.new}
  it "responds to 'balance' attribute" do
    expect(subject).to have_attributes(:balance => 0)
    # expect(subject.balance).to eq(0)
  end

end
