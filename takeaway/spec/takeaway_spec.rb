require "takeaway"

RSpec.describe Takeaway do
  context "initially" do
    it "returns an empty order list" do
      takeaway = Takeaway.new
      expect(takeaway.show_order).to eq []
    end

    it "has an order total of 0" do
      takeaway = Takeaway.new
      expect(takeaway.order_total).to eq 0
    end
  end

  describe "ordering food behaviour" do
    it "adds food to the order" do
      takeaway = Takeaway.new
      food = double :food, name: "chips", price: 2
      takeaway.order(food)
      expect(takeaway.show_order).to eq [food]
    end

    it "it prints the price of one item and order total for one item" do
      takeaway = Takeaway.new
      food = double :food, name: "chips", price: 2
      food_2 = double :food, name: "pizza", price: 8
      takeaway.order(food)
      takeaway.order(food_2)
      expect(takeaway.receipt).to eq "Your total is £10.00"
    end
  end
end
