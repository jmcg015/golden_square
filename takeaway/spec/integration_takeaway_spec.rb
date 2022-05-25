require "takeaway"
require "food"

RSpec.describe "integration tests" do
  it "adds food to the menu, including name and price" do
    terminal = double :terminal
    takeaway = Takeaway.new(terminal)
    food_1 = Food.new("chips", 2)
    food_2 = Food.new("pizza", 8)
    takeaway.add_to_menu(food_1)
    takeaway.add_to_menu(food_2)
    expect(terminal).to receive(:puts).with("Chips: £2.00")
    expect(terminal).to receive(:puts).with("Pizza: £8.00")
    takeaway.show_menu
  end

  it "adds food to the order" do
    terminal = double :terminal
    takeaway = Takeaway.new(terminal)
    food_1 = Food.new("chips", 2)
    takeaway.order(food_1)
    expect(takeaway.show_order).to eq [food_1]
  end

  it "shows an itemized cost of each item in order and shows a grand total" do
    terminal = double :terminal
    takeaway = Takeaway.new(terminal)
    food_1 = Food.new("chips", 2)
    food_2 = Food.new("pizza", 8)
    takeaway.order(food_1)
    takeaway.order(food_2)
    expect(terminal).to receive(:puts).with("Chips: £2.00").ordered
    expect(terminal).to receive(:puts).with("Pizza: £8.00").ordered
    takeaway.receipt
    expect(takeaway.order_total).to eq "Your total is £10.00"
  end
end
