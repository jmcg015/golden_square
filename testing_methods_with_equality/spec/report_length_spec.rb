require "report_length"

RSpec.describe "report_length method" do
  it "returns character length of 5 for 'hello'" do
    expect(report_length("hello")).to eq "This string was 5 characters long."
  end

  it "returns a character length of 15 for 'Hello there bob'" do
    str = "Hello there bob"
    expect(report_length(str)).to eq "This string was 15 characters long."
  end
end
