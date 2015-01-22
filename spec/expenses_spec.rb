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
      expense = Expenses.new({:id => nil, :item => 'food', :cost => 100, :date => '2015-01-22'})
      expense.save()
      expect(Expenses.all()).to(eq([expense]))
    end
  end
end
