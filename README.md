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

Download repo
```bash
> bundle install
```
Run the following for test
```bash
> rspec
```

## Available methods

show_balance
- will display balance of the account

deposit(amount)
- make deposit of <amount>

withdraw(amount)
- make withdraw of <amount>

display_transactions
- print a bank statement
