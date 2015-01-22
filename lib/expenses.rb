class Expenses
  attr_reader(:id, :item, :cost, :date)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @item = attributes.fetch(:item)
    @cost = attributes.fetch(:cost)
    @date = attributes.fetch(:date)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense[:id].to_i()
      item = expense.fetch("item")
      cost = expense.fetch("cost").to_i()
      date = expense.fetch("date")
      expenses.push(Expenses.new({:id => id, :item => item, :cost => cost, :date => date}))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (item, cost, date) VALUES ('#{@item}', #{@cost}, '#{@date}') RETURNING id")
    @id = result.first().fetch("id").to_i()
  end
end
