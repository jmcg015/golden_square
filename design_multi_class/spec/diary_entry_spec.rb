require "diary_entry"

RSpec.describe DiaryEntry do
  it "returns the title of the entry" do
    entry = DiaryEntry.new("Monday", "one two three")
    expect(entry.title).to eq "Monday"
  end

  it "returns the contents of the entry" do
    entry = DiaryEntry.new("Monday", "one two three")
    expect(entry.contents).to eq "one two three"
  end

  context "with entries added" do
    describe "@count_words" do
      it "returns an integer for all words in contents" do
        entry = DiaryEntry.new("Monday", "one two three")
        expect(entry.count_words).to eq 3
      end

      it "returns 0 if contents is empty" do
        entry = DiaryEntry.new("Monday", "")
        expect(entry.count_words).to eq 0
      end
    end
  end
end
