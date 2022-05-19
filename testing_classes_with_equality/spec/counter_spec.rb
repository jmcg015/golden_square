require "counter"

RSpec.describe Counter do
  it "increases the counter from 0 to 5" do
    counter = Counter.new
    counter.add(5)
    result = counter.report
    expect(result).to eq "Counted to 5 so far."
  end

  it "increases the counter from 0 to 50" do
    counter = Counter.new
    counter.add(50)
    result = counter.report
    expect(result).to eq "Counted to 50 so far."
  end

  it "increases the counter from 0 to 125" do
    counter = Counter.new
    counter.add(125)
    result = counter.report
    expect(result).to eq "Counted to 125 so far."
  end
end
