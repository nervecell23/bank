__bank__ is a class which simulates a bank account. Each instance of the class is a simulated bank account in which a user can have a balance, make deposit, make withdraw and print(display) a bank statement showing all transactions made so far.

## User story
As a user - I can have an account

As a user - I can specify initial balance when create account

As a user - I can see balance

As a user - I can make withdraw

As a user - I can see error notice when withdraw more than balance

As a user - I can see error notice when withdraw negative amount

As a user - I can make deposit

As a user - I can see error notice when make negative deposit

As a user - I can have withdraw transaction recorded

As a user - I can have deposit transaction recorded

As a user - I can produce bank statement

## Installation & Test

Download repo and run:
```bash
> bundle install
```
For test, run:
```bash
> rspec
```
## Usage

After installation a user can interact with the code via REPL i.e. irb or pry

To create a new account, run the following in your REPL:
```bash
> require "./lib/account.rb"
> new_account = Account.new(initial_balance) #initial balance is zero by default
```
The following methods are available:

- show_balance

will display balance of the account

- deposit(amount)

make deposit of __amount__

- withdraw(amount)

make withdraw of __amount__

- display_transactions

print a bank statement
