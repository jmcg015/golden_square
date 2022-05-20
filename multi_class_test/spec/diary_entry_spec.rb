require "diary_entry"

RSpec.describe DiaryEntry do
  context "when adding a diary entry" do
    it "returns the title of the entry" do
      entry = DiaryEntry.new("Monday", "one two three")
      expect(entry.title).to eq "Monday"
    end

    it "returns the content" do
      entry = DiaryEntry.new("Monday", "one two three")
      expect(entry.contents).to eq "one two three"
    end
  end

  context "with entries added" do
    describe "@count_words" do
      it "returns an integer counting all words in contents" do
        entry = DiaryEntry.new("Monday", "one two three")
        expect(entry.count_words).to eq 3
      end

      it "returns zero if contents is empty" do
        entry = DiaryEntry.new("Monday", "")
        expect(entry.count_words).to eq 0
      end

      it "returns one if contents is one word" do
        entry = DiaryEntry.new("Monday", "one")
        expect(entry.count_words).to eq 1
      end
    end

    describe "@reading_time" do
      #When wpm is 0?
      it "fails if wpm is zero" do
        entry = DiaryEntry.new("Monday", "one two")
        expect { entry.reading_time(0) }.to raise_error "WPM must be positive"
      end

      it "returns zero if contents is empty" do
        entry = DiaryEntry.new("Monday", "")
        expect(entry.reading_time(2)).to eq 0
      end

      it "returns one if contents is one word" do
        entry = DiaryEntry.new("Monday", "one")
        expect(entry.reading_time(2)).to eq 1
      end

      it "returns an integer counting all words in contents" do
        entry = DiaryEntry.new("Monday", "one two three four five")
        expect(entry.reading_time(2)).to eq 3
      end

      it "returns a string with part of the contents the user could read in the given number of minutes" do
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
  end
end
