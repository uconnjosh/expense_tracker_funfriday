class Expense
  attr_reader :cost, :description, :date, :id

  def initialize(description, cost, date, id=nil)
    @description = description
    @cost = cost
    @date = date
    @id = id
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      cost = result['cost'].to_f
      date = result['date']
      id = result['id'].to_i
      expenses << Expense.new(description, cost, date, id)
    end
    expenses
  end

  def save
    results = DB.exec("INSERT INTO expenses (description, cost, date) VALUES ('#{@description}', #{@cost}, '#{@date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_expense)
    self.description == another_expense.description && self.cost == another_expense.cost && self.date == another_expense.date && self.id == another_expense.id
    end
end
