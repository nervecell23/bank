# frozen_string_literal: true

require 'transaction'
require 'date'

describe Transaction do
  date_now = DateTime.now.to_date
  credit = 1234.0
  debit = nil
  let(:subject) { Transaction.new(date_now, credit, debit, 1000) }

  it 'has attributes correctly set when created' do
    expect(subject).to have_attributes(transaction_date: date_now)
    expect(subject).to have_attributes(credit: 1234.0)
    expect(subject).to have_attributes(debit: nil)
    expect(subject).to have_attributes(balance: 1000)
  end

end
