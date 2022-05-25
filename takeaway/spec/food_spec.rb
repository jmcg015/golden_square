require "food"

RSpec.describe Food do
  it "returns the name of the food item" do
    food = Food.new("chips", 2)
    expect(food.name).to eq "chips"
  end

  it "it returns the price of the food item" do
    food = Food.new("chips", 2)
    expect(food.price).to eq 2
  end
end
