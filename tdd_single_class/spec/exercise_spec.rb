require "exercise"

RSpec.describe DiaryEntry do
  it "returns the title as a string." do
    entry = DiaryEntry.new("Monday", "Example." * 100)
    expect(entry.title).to eq "Monday"
  end

  it "returns the contents as a string." do
    entry = DiaryEntry.new("Monday", "Example.")
    expect(entry.contents).to eq "Example."
  end

  it "Returns the number of words in the contents as an integer." do
    entry = DiaryEntry.new("Monday", "Example.")
    expect(entry.count_words).to eq 1
  end

  it "Returns an integer representing an estimate of the reading time in 
    minutes." do
    entry = DiaryEntry.new("Monday", "Example. " * 10000)
    result = entry.reading_time(100)
    expect(result).to eq 100
  end

  it "Returns a string with part of the contents that the user could read
      in the given number of minutes." do
    entry = DiaryEntry.new("Monday", "Example. Another word to go here.")
    result = entry.reading_chunk(1, 5)
    expect(result).to eq "Example. Another word to go"
  end

  it "returns the next chunk, skipping what's been read" do
    entry = DiaryEntry.new("Monday", "One two three")
    first_result = entry.reading_chunk(2, 1)
    second_result = entry.reading_chunk(2, 1)
    expect(second_result).to eq "three"
  end

  it "restarts after reading the whole contents" do
    entry = DiaryEntry.new("Monday", "One two three")
    entry.reading_chunk(2, 1)
    entry.reading_chunk(2, 1)
    chunk = entry.reading_chunk(2, 1)
    expect(chunk).to eq "One two"
  end

  it "restarts if ends on last word" do
    entry = DiaryEntry.new("Monday", "One two three")
    entry.reading_chunk(2, 1)
    entry.reading_chunk(1, 1)
    chunk = entry.reading_chunk(2, 1)
    expect(chunk).to eq "One two"
  end
end
