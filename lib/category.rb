class Category
  attr_reader :id, :type
  def initialize(type, id=nil)
    @id = id
    @type = type
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      type = result['type']
      id = result['id']
      categories << Category.new(type)
    end
    categories
  end

  def self.create(type, id=nil)
    new_category = Category.new(type)
    new_category.save
    new_category
  end

  def save
    results = DB.exec("INSERT INTO categories (type) VALUES ('#{type}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_category)
    self.type == another_category.type
  end
end
