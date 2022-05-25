require "takeaway"
require "food"

RSpec.describe "integration tests" do
  it "adds food to the menu, including name and price" do
    takeaway = Takeaway.new
    food_1 = Food.new("chips", 2)
    takeaway.add_to_menu(food_1)
    expect(takeaway.show_menu).to eq [food_1]
  end

  xit "adds food to the order" do
  end

  xit "shows an itemized cost of each item in order and shows a grand total" do
  end
end
