class Expense
  attr_reader :cost, :description, :date, :id, :amount

  def initialize(attributes)
    @description = attributes[:description]
    @cost = attributes[:cost]
    @date = attributes[:date]
    @id = attributes[:id]
    @amount = attributes[:amount]
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      cost = result['cost'].to_f
      date = result['date']
      id = result['id'].to_i
      expenses << Expense.new({:description => description, :cost => cost, :date => date, :id => id})
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

  def update_description(description)
    results = DB.exec("UPDATE expenses SET description = '#{@description}' WHERE id = #{@id};")
  end

  def update_amount(cost)
    results = DB.exec("UPDATE expenses SET cost = '#{@cost}' WHERE id = #{@id};")
  end

  def update_date(date)
    results = DB.exec("UPDATE expenses SET date  = '#{@date}' WHERE id = #{@id};")
  end


end







