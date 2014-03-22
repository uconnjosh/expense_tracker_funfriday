class Exp_cat
  attr_reader :expense_id, :category_id, :id

  def initialize(expense_id, category_id, id=nil)
    @expense_id = expense_id
    @category_id = category_id
  end

  def self.all
    @exp_cats = []
    results = DB.exec("SELECT * FROM exp_cat")
    results.each do |result|
      expense_id = result['expense_id'].to_i
      category_id = result['category_id'].to_i
      id = result['id'].to_i
      @exp_cats << Exp_cat.new(expense_id, category_id, id)
    end
    @exp_cats
  end

  def save
    results = DB.exec("INSERT INTO exp_cat (expense_id, category_id) VALUES ('#{@expense_id}', '#{@category_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end
  def ==(another_exp_cat)
    self.expense_id == another_exp_cat.expense_id && self.category_id == another_exp_cat.category_id
  end
end
