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

  describe("#==") do
    it("is the same category if it has the same category_name") do
      category1 = Categories.new({:id => nil, :category_name => 'food', :budget => 333 })
      category2 = Categories.new({:id => nil, :category_name => 'food', :budget => 333 })
      expect(category1).to(eq(category2))
    end
  end
end
