require 'spec_helper'

describe 'Expense' do
  it 'initializes a new instance of expense' do
    test_expense = Expense.new("Coffe", 2.00, '2014-03-21')
    test_expense.should be_an_instance_of Expense
  end
  describe '.all' do
    it 'starts of as an empty array' do
      Expense.all.should eq []
    end
  end
  describe 'save' do
    it 'save a new expense to the database' do
      test_expense = Expense.new("Coffe", 2.00, '2014-03-21', 5)
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end
  describe '==(another_expense)' do
    it "should be the same expense if it is the same description, amount, date, and id" do
      test_expense = Expense.new("Coffe", 2.00, '2014-03-21', 1)
      test_expense2 = Expense.new("Coffe", 2.00, '2014-03-21', 1)
      test_expense.should eq test_expense2
    end
  end

end
