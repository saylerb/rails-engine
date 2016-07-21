# Rails Engine

Rails engine is a project where we practiced using advanced ActiveRecord to serve up an API using data from Etsy.

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
