require "takeaway"

RSpec.describe Takeaway do
  context "initially" do
    it "returns an empty order list" do
      terminal = double :terminal
      takeaway = Takeaway.new(terminal)
      expect(takeaway.show_order).to eq []
    end

    it "has an order total of 0" do
      terminal = double :terminal
      takeaway = Takeaway.new(terminal)
      expect(takeaway.order_total).to eq "Your total is £0.00"
    end
  end

  describe "ordering food behaviour" do
    it "adds food to the menu, including name and price" do
      terminal = double :terminal
      takeaway = Takeaway.new(terminal)
      food = double :food, name: "chips", price: 2
      food_2 = double :food, name: "pizza", price: 8
      takeaway.add_to_menu(food)
      takeaway.add_to_menu(food_2)
      expect(terminal).to receive(:puts).with("Chips: £2.00")
      expect(terminal).to receive(:puts).with("Pizza: £8.00")
      takeaway.show_menu
    end

    it "adds food to the order" do
      terminal = double :terminal
      takeaway = Takeaway.new(terminal)
      food = double :food, name: "chips", price: 2
      takeaway.order(food)
      expect(takeaway.show_order).to eq [food]
    end

    it "it prints the price of one item and order total for one item" do
      terminal = double :terminal
      takeaway = Takeaway.new(terminal)
      food = double :food, name: "chips", price: 2
      food_2 = double :food, name: "pizza", price: 8
      takeaway.order(food)
      takeaway.order(food_2)
      expect(terminal).to receive(:puts).with("Chips: £2.00").ordered
      expect(terminal).to receive(:puts).with("Pizza: £8.00").ordered
      takeaway.receipt
      expect(takeaway.order_total).to eq "Your total is £10.00"
    end
  end
end
