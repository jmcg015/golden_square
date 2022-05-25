require "takeaway"
require "food"

RSpec.describe "integration tests" do
  it "adds food to the menu, including name and price" do
    takeaway = Takeaway.new
    food_1 = Food.new("chips", 2)
    takeaway.add_to_menu(food_1)
    expect(takeaway.show_menu).to eq [food_1]
  end

  it "adds food to the order" do
    takeaway = Takeaway.new
    food_1 = Food.new("chips", 2)
    takeaway.order(food_1)
    expect(takeaway.show_order).to eq [food_1]
  end

  it "shows an itemized cost of each item in order and shows a grand total" do
    takeaway = Takeaway.new
    food_1 = Food.new("chips", 2)
    food_2 = Food.new("pizza", 8)
    takeaway.order(food_1)
    takeaway.order(food_2)
    expect(takeaway.receipt).to eq "Your items are: chips - £2.00 pizza - £8.00. Your total is £10.00"
  end
end
