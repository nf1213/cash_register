[![Build Status](https://travis-ci.org/nf1213/cash_register.svg?branch=master)](https://travis-ci.org/nf1213/cash_register) [![Code Climate](https://codeclimate.com/github/nf1213/cash_register.png)](https://codeclimate.com/github/nf1213/cash_register) [![Coverage Status](https://coveralls.io/repos/nf1213/<cash_register>/badge.png)](https://coveralls.io/r/nf1213/cash_register)

README

Database:

Models:
  Item
    name:string
    price:integer (in cents)

  Mod
    name:string
    price:integer (in cents, optional)

  Modification
    item_id:integer
    mod_id:integer

  Transaction
    timestamps
    total:integer (in cents)
    payment_method: string
    payment_given:integer (in cents)

  TransactionItem
    transaction_id:integer
    item_id:integer

  TransactionalModification
    transaction_item_id:integer
    modification_id:integer


(Extras)

  Employee
    name:string
    password:string
    status:string

  Shift
    employee_id:integer
    clock_in:time
    clock_out:time
