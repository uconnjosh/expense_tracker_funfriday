require 'spec_helper'

describe 'Category' do
  it "should be initialized with a category name" do
    test_cat = Category.new("fun")
    test_cat.should be_an_instance_of Category
  end

  it "is initialized with its name" do
    test_cat = Category.new("fun")
    test_cat.type.should eq "fun"
  end

  describe '.all' do
    it "starts with an empty array" do
      Category.all.should eq []
    end
  end
  describe '#save' do
    it "saves the new category to the database" do
      test_cat = Category.new("fun")
      test_cat.save
      Category.all.should eq [test_cat]
    end
  end
  describe '==(another_cat)' do
    it "is the same category if it is the same type" do
      test_cat = Category.new('fun')
      test_cat1 = Category.new('fun')
      test_cat.should eq test_cat1
    end
  end
  describe 'create' do
    it "initializes and saves a new category" do
      test_category = Category.create("school")
      Category.all.should eq [test_category]
    end
  end
end
