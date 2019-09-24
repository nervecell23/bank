# frozen_string_literal: true

require 'transaction'
require 'date'

describe Transaction do
  date_now = DateTime.now.to_date
  let(:subject) { Transaction.new(date_now, 0, 0, 1000) }

  it 'has attributes date, credit, debit and balance' do
    expect(subject).to have_attributes(transaction_date: date_now)
    expect(subject).to have_attributes(credit: 0)
    expect(subject).to have_attributes(debit: 0)
    expect(subject).to have_attributes(balance: 1000)
  end
end
