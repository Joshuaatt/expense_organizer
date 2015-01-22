require('rspec')
require('pg')
require('categories')
require('spec_helper')

describe(Categories) do
  describe(".all") do
    it("starts off with no categories") do
      expect(Expenses.all()).to(eq([]))
    end
  end
end
