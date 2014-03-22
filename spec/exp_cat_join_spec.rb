require 'spec_helper'

describe 'Exp_cat' do
  it 'initialized a new instance of Exp_cat' do
    test_exp_cat = Exp_cat.new(1,1)
    test_exp_cat.should be_an_instance_of Exp_cat
  end
  it 'gives you the category and expense ids' do
    test_exp_cat = Exp_cat.new(1,2)
    test_exp_cat.expense_id.should eq 1
    test_exp_cat.category_id.should eq 2
  end
  describe '.all' do
    it "starts with an empty array" do
      Exp_cat.all.should eq []
    end
  end
  describe 'save' do
    it "saves the instance of exp_cat to the database" do
      test_exp_cat = Exp_cat.new(1,2)
      test_exp_cat.save
      Exp_cat.all.should eq [test_exp_cat]
    end
  end
  describe '==(another_exp_cat)' do
    it "is the same join if it has the same expense id and category id" do
      test_exp_cat = Exp_cat.new(1,2)
      test_exp_cat.save
      test_exp_cat2 = Exp_cat.new(1,2)
      test_exp_cat2.save
      test_exp_cat.should eq test_exp_cat2
      end
    end
end
