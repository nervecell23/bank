# frozen_string_literal: true

require 'transaction'
require 'date'

describe Transaction do
  date_now = DateTime.now.to_date
  let(:subject_deposit) { Transaction.new(date_now, 1234.0, nil, 1000.0) }
  let(:subject_withdraw) { Transaction.new(date_now, nil, 2345.0, 5000.0) }

  it 'has attributes correctly set when created for deposit' do
    expect(subject_deposit).to have_attributes(transaction_date: date_now)
    expect(subject_deposit).to have_attributes(credit: 1234.0)
    expect(subject_deposit).to have_attributes(debit: nil)
    expect(subject_deposit).to have_attributes(balance: 1000.0)
  end

  it 'has attributes correctly set when created for withdraw' do
    expect(subject_withdraw).to have_attributes(transaction_date: date_now)
    expect(subject_withdraw).to have_attributes(credit: nil)
    expect(subject_withdraw).to have_attributes(debit: 2345.0)
    expect(subject_withdraw).to have_attributes(balance: 5000.0)
  end
end
