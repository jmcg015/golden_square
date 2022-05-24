require "diary"

RSpec.describe Diary do
  it "returns the contents of diary as a string" do
    diary = Diary.new("Hello there")
    expect(diary.read).to eq "Hello there"
  end
end
