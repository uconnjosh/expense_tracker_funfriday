require 'spec_helper'

describe 'Expense' do
  it 'initializes a new instance of expense' do
    test_expense = Expense.new({:description => "Shake Weight"})
    test_expense.should be_an_instance_of Expense
  end
  describe '.all' do
    it 'starts of as an empty array' do
      Expense.all.should eq []
    end
  end
  describe 'save' do
    it 'saves a new expense to the database' do
      test_expense = Expense.new({:description => "Shake Weight", :cost => 5.00, :date => '2008-04-17'})
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end
  describe '==(another_expense)' do
    it "should be the same expense if it is the same description, amount, date, and id" do
      test_expense = Expense.new({:description => "Shake Weight"})
      test_expense2 = Expense.new({:description => "Shake Weight"})
      test_expense.should eq test_expense2
    end
  end
  describe 'update' do
    it 'should allow you to update a description, amount, and date' do
      test_expense = Expense.new({:description => "Shake Weight", :cost => 5, :date => "2014-03-21"})
      test_expense.save
      test_expense.update_description("Shake Weight Supremo")
      test_expense.update_cost(5000.00)
      test_expense.update_date('2014-05-21')
      test_expense.description.should eq ("Shake Weight")
      test_expense.cost.should eq (5)
      test_expense.date.should eq ("2014-03-21")
    end
  end
end
