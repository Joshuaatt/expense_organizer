class Expenses
  attr_reader(:id, :item, :cost, :date)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @item = attributes.fetch(:item)
    @cost = attributes.fetch(:cost)
    @date = attributes.fetch(:date)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expenses.fetch("id").to_i()
      item = expenses.fetch("item")
      cost = expenses.fetch("cost").to_i()
      date = expenses.fetch("date")
      expenses.push(Expenses.new({:id => id, :item => item, :cost => cost, :date => date}))
    end
    expenses
  end
end
