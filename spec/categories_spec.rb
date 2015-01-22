require('rspec')
require('pg')
require('pry')
require('categories')
require('spec_helper')

describe(Categories) do
  describe(".all") do
    it("starts off with no categories") do
      expect(Categories.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save categories to the database") do
      category = Categories.new({:id => nil, :category_name => 'food', :budget => 222})
      category.save()
      expect(Categories.all()).to(eq([category]))
    end
  end
end
