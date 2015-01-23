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

  describe("#add_expense") do
    category1 = Categories.new({:id => nil, :category_name => 'food', :budget => 333 })
    category1.save()
    category2 = Categories.new({:id => nil, :category_name => 'toys', :budget => 444 })
    category2.save()
    expense1 = Expenses.new({:id => nil, :item => 'apple', :cost => 100, :date => '2015-01-22'})
    expect(category1.expenses()).to(eq([expense1]))
  end
  # define_method("#find_expenses") do # find an expense related to a given category
  #   it("returns a list of expenses in a category") do
  #
  #   end
  # end

  # describe(".find") do
  #   it("returns a category by its ID number") do
  #     test_category = Categories.new({:id => nil, :category_name => "food", :budget => 555})
  #     test_category.save()
  #     test_category2 = Categories.new({:id => nil, :category_name => "toys", :budget => 444})
  #     test_category2.save()
  #     expect(Categories.find(test_category2.id())).to(eq(test_category2))
  #   end
  # end
end
