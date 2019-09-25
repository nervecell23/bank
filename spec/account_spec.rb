# frozen_string_literal: true

require 'account'
require 'date'

describe Account do
  let(:records_inst_double) { double('records_inst_double') }
  let(:subject) { Account.new(1000.0, records_inst_double) }

  before(:each) { allow(records_inst_double).to receive(:create_transaction) }

  it 'can be added an initial balance when created' do
    expect { subject.show_balance }.to output("Your balance: 1000.00\n").to_stdout
  end

  describe '#show_balance' do
    it 'it displays the balance' do
      expect { subject.show_balance }.to output("Your balance: 1000.00\n").to_stdout
    end
  end

  describe '#withdraw' do
    it 'does not proceed in case of not enough balance and show error notice' do
      expect { subject.withdraw(1001.0) }.to output("Not enough balance\n").to_stdout
      expect(records_inst_double).not_to have_received(:create_transaction)
    end

    it 'does not allow withdrawing negative amount and show error notice' do
      expect { subject.withdraw(-1.0) }.to output("Can not withdraw negative amount\n").to_stdout
      expect(records_inst_double).not_to have_received(:create_transaction)
    end

    it 'creates transaction record for withdraw' do
      subject.withdraw(200.0)
      expect(records_inst_double).to have_received(:create_transaction).with(
        instance_of(DateTime), nil, 200.0, 800.0
      )
    end
  end

  describe '#deposit' do
    it 'does not allow deposit of negative amount and show error notice' do
      expect { subject.deposit(-1.0) }.to output("Can not deposit negative amount\n").to_stdout
      expect(records_inst_double).not_to have_received(:create_transaction)
    end

    it 'creates transaction record for deposit' do
      subject.deposit(500.0)
      expect(records_inst_double).to have_received(:create_transaction).with(
        instance_of(DateTime), 500.0, nil, 1500.0
      )
    end
  end
end
