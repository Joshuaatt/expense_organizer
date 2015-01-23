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

  define_method(:add_expense) do # add expense and relate it to a category
    result = DB.exec("INSERT INTO expenses_categories ...")
    expenses = []
  end

  define_method(:find_expenses) do # find expenses related to a given category
      returned_expenses = DB.exec("SELECT expenses.* FROM
      categories JOIN expenses_categories ON (categories.id = expenses_categories.categories_id) JOIN expenses ON (expenses_categories.expenses_id = expenses.id) WHERE categories.id = #{self.id};")
      expenses = []
      returned_expenses.each() do |expense|
        id = expense.fetch("id").to_i()
        item = expense.fetch("item")
        cost = expense.fetch("cost").to_i()
        date = expense.fetch("date")
        expenses.push(Expenses.new({:id => id, :item => item, :cost => cost, :date => date}))
      end
      expenses
    end
  end
end
