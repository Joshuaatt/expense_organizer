class Categories
  attr_reader(:id, :category_name, :budget)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @category_name = attributes.fetch(:category_name)
    @budget = attributes.fetch(:budget)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      id = category.fetch("id").to_i()
      category_name = category.fetch("category_name")
      budget = category.fetch("budget").to_i()
      categories.push(Categories.new({:id => id, :category_name => category_name, :budget => budget}))
    end
    categories
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (category_name, budget) VALUES ('#{@category_name}', #{@budget}) RETURNING id")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.category_name().==(another_category.category_name()).&(self.id().==(another_category.id()))
  end
end
