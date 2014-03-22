require 'rspec'
require 'pg'
require 'expenses'
require 'category'
require 'exp_cat_join'
require 'pry'

DB = PG.connect(:dbname => 'expense_tracker_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
    DB.exec("DELETE FROM exp_cat *;")
  end
end
