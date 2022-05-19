require "gratitudes"

RSpec.describe Gratitudes do
  it "initially returns an empty list of gratitudes" do
    gratitudes = Gratitudes.new
    expect(gratitudes.format).to eq "Be grateful for: "
  end

  it "outputs one gratitude" do
    gratitudes = Gratitudes.new
    gratitudes.add("food")
    expect(gratitudes.format).to eq "Be grateful for: food"
  end

  it "outputs three things to be grateful for" do
    gratitudes = Gratitudes.new
    gratitudes.add("food")
    gratitudes.add("drink")
    gratitudes.add("dogs")
    expect(gratitudes.format).to eq "Be grateful for: food, drink, dogs"
  end
end
