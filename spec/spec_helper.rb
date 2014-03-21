require 'rspec'
require 'pg'
require 'expenses'
require 'pry'

DB = PG.connect(:dbname => 'expense_tracker_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
  end
end
