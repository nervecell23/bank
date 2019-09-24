# frozen_string_literal: true

require 'records'
require 'date'

describe Records do
  describe '#create_transaction' do
    let(:transaction_inst_double) do
      double('transaction_inst_double',
             transaction_date: DateTime.new(2011, 1, 28),
             credit: 200.0,
             debit: nil,
             balance: 1500.0)
    end

    let(:transaction_class_double) { double('transaction_class') }
    let(:subject) { Records.new(transaction_class_double) }

    before(:each) do
      allow(transaction_class_double).to receive(:new).and_return(
        transaction_inst_double
      )
    end

    it 'creates new instance of transaction class' do
      subject.create_transaction(DateTime.now, 500.0, nil, 1500.0)
      expect(transaction_class_double).to have_received(:new).with(
        instance_of(DateTime), 500.0, nil, 1500.0
      )
    end

    it 'push newly created instance to transaction list' do
      subject.create_transaction(DateTime.now, 200.0, nil, 1500.0)
      expect { subject.display_transactions }.to output(
        "date || credit || debit || balance\n#{DateTime.new(2011, 1, 28).strftime('%d/%m/%Y')} "\
        "|| 200.00 || || 1500.00\n"
      ).to_stdout
    end
  end

  describe '#display_transactions' do
    it 'display error notice when transaction list is empty' do
      subject = Records.new
      expect { subject.display_transactions }.to output("There is no transaction\n").to_stdout
    end
  end
end
