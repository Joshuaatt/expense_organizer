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
end
