require "greet"

RSpec.describe "greet method" do
  it "returns 'Hello, Joe'" do
    name = greet("Joe")
    expect(name).to eq "Hello, Joe"
  end
end
