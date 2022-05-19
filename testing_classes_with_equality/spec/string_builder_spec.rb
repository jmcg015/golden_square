require "string_builder"

RSpec.describe StringBuilder do
  it "returns an empty string as initial output" do
    str = StringBuilder.new
    expect(str.output).to eq ""
  end

  it "returns an empty string length as 0 for inital output" do
    str = StringBuilder.new
    expect(str.size).to eq 0
  end

  it "returns the string 'hello'" do
    str = StringBuilder.new
    str.add("hello")
    result = str.output
    expect(result).to eq "hello"
  end

  it "returns length of 5" do
    str = StringBuilder.new
    str.add("hello")
    result = str.size
    expect(result).to eq 5
  end

  context "given multiple strings" do
    it "adds the words to the string to output one long word" do
      str = StringBuilder.new
      str.add("hello")
      str.add("there")
      str.add("Bruce")
      expect(str.output).to eq "hellothereBruce"
    end

    it "outputs length of combined string as 15" do
      str = StringBuilder.new
      str.add("hello")
      str.add("there")
      str.add("Bruce")
      expect(str.size).to eq 15
    end
  end
end
