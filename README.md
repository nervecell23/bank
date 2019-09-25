__bank__ is a class which simulates a bank account. Each instance of the class is a simulated bank account in which a user can have a balance, make deposit, make withdraw and print(display) a bank statement showing all transactions made so far.

## Approach & code structure

The simulated bank account is implemented in __Account__ class in which several methods are implemented for basic operations i.e. deposit, withdraw, show balance. Records related operations are implemented in a second class __Records__. Separating storage of transaction records from aforementioned basic operations would make it easier for testing and future improvement. Also, It is considered that each transaction record is a self-contained object containing information of previous operation, it is better to use a third class __Transaction__ to implement a single entry of transaction record. Instances of transactions are created and stored in a container in __Records__ class.

## User story implemented

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
For Rspec test, run:
```bash
> rspec
```
For Linter test, run:
```bash
> rubocop
```

## Usage

After installation a user can interact with the code via REPL i.e. irb or pry

To create a new account, run the following in your REPL:
```bash
> require "./lib/account.rb"
> new_account = Account.new([initial_balance]) #initial_balance is optional and is zero by default
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

## Dependencies & tools used

- Rspec for testing
- SimpleCov & SimpleCov-console for displaying test coverage
- Pry for debugging
- Rubocop for linter
