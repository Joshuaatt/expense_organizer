require('rspec')
require('pg')
require('expenses')
require('spec_helper')

describe(Expenses) do
  describe(".all") do
    it("starts off with no expenses") do
      expect(Expenses.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save expenses to the database") do
      expense = Expenses.new({:id => nil, :item => 'apple', :cost => 100, :date => '2015-01-22'})
      expense.save()
      expect(Expenses.all()).to(eq([expense]))
    end
  end

  describe("#==") do
    it("is the same expense if it has the same item") do
      expense1 = Expenses.new({:id => nil, :item => 'apple', :cost => 100, :date => '2015-01-22'})
      expense2 = Expenses.new({:id => nil, :item => 'apple', :cost => 100, :date => '2015-01-22'})
      expect(expense1).to(eq(expense2))
    end
  end
end
