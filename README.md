## Rails Engine

### Description

Rails engine is a project where we practiced using advanced ActiveRecord to serve up an API using data from Etsy.

[Original Spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)

### Installation

* Ruby version: 2.3.0
* System dependencies: Rails 5.0
* Installation

``` bash
git clone https://github.com/saylerb/rails-engine.git
cd rails-engine
bundle
rails db:create db:migrate
rake import:all
```

Run the test suite by with `rspec`. To run the spec harness, clone down the repo `git clone git@github.com:turingschool/rales_engine_spec_harness.git`, `bundle`. Run a server with `rails s` and then run `rake test`.


## API Endpoints

Below is a list of the API endpoints available.

#### Merchants
###### Collection
  1. `GET /api/v1/merchants/random`
  1. `GET /api/v1/merchants/find`
  1. `GET /api/v1/merchants/find_all`
  1. `GET /api/v1/merchants/most_revenue`
  1. `GET /api/v1/merchants/most_items`

###### Member
  1. `GET /api/v1/merchants/:id/items`
  1. `GET /api/v1/merchants/:id/invoices`
  1. `GET /api/v1/merchants/:id/revenue`
  1. `GET /api/v1/merchants/:id/favorite_customer`
  1. `GET /api/v1/merchants/:id/customers_with_pending_invoices`

#### Customers
###### Collection
  1. `GET /api/v1/customers/random`
  1. `GET /api/v1/customers/find_all`
  1. `GET /api/v1/customers/find`

###### Member
  1. `GET /api/v1/customers/:id/invoices`
  1. `GET /api/v1/customers/:id/transactions`
  1. `GET /api/v1/customers/:id/favorite_merchant`

#### Items
###### Collection
  1. `GET /api/v1/items/random`
  1. `GET /api/v1/items/find_all`
  1. `GET /api/v1/items/find`
  
###### Member
  1. `GET /api/v1/items/:id/merchant` 
  1. `GET /api/v1/items/:id/invoice_items`
 
#### Invoices
###### Collection
  1. `GET /api/v1/invoices/random`
  1. `GET /api/v1/invoices/find_all`
  1. `GET /api/v1/invoices/find`
  
###### Member
   1. `GET /api/v1/invoices/:id/customer`
   1. `GET /api/v1/invoices/:id/merchant`
   1. `GET /api/v1/invoices/:id/transactions`
   1. `GET /api/v1/invoices/:id/invoice_items`
   1. `GET /api/v1/invoices/:id/items`

##### Invoice Items
###### Collection
  1. `GET /api/v1/invoice_items/random`
  1. `GET /api/v1/invoice_items/find_all`
  1. `GET /api/v1/invoice_items/find`
  
###### Member
  1. `GET /api/v1/invoice_items/:id/invoice`
  1. `GET /api/v1/invoice_items/:id/item`
  
##### Transactions

###### Collection
  1. `GET /api/v1/transactions/random`
  1. `GET /api/v1/transactions/find_all`
  1. `GET /api/v1/transactions/find`

###### Member
  1. `GET /api/v1/transactions/:id/invoice`
