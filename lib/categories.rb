class Categories
  attr_reader(:id, :category_name, :budget)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch("id").to_i()
    @category_name = attributes.fetch("category_name")
    @budget = attributes.fetch("budget")
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_expenses.each() do |category|
      id = category.fetch("id").to_i()
      category_name = category.fetch("category_name")
      budget = category.fetch("budget").to_i()
      categories.push(Categories.new({:id => id, :category_name => category_name, :budget => budget}))
    end
    categories
  end
end
