require "diary"
require "diary_entry"

RSpec.describe Diary do
  context "when we add entries to the diary" do
    it "adds the entries to the diary" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Monday", "four five six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end
  end

  context "word counting behaviour" do
    it "returns the number of words in all entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Monday", "four five six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 6
    end

    it "fails when wpm is zero" do
      diary = Diary.new
      entry = DiaryEntry.new("Monday", "one two")
      diary.add(entry)
      expect { diary.reading_time(0) }.to raise_error "WPM must be positive"
    end

    it "calculates the reading time for all entries where it fits exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Monday", "four five six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "calculates the reading time for all entries where it doesn't fit exactly" do
      #Case when wpm is 0?
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Monday", "four five")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  describe "best reading time behaviour" do
    it "fails where wpm is 0" do
      diary = Diary.new
      entry = DiaryEntry.new("Monday", "one two")
      diary.add(entry)
      expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "WPM must be positive"
    end

    context "where we have one entry and is readable in time frame" do
      it "returns that entry" do
        diary = Diary.new
        entry = DiaryEntry.new("Monday", "one two")
        diary.add(entry)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq entry
      end
    end

    context "where we have one entry and is unreadable in time frame" do
      it "returns nil" do
        diary = Diary.new
        entry = DiaryEntry.new("Monday", "one two three")
        diary.add(entry)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "where we have more than one entry" do
      it "returns the longest entry the user could read in the given time" do
        diary = Diary.new
        best_entry = DiaryEntry.new("Monday", "one two")
        diary.add(DiaryEntry.new("Monday", "one"))
        diary.add(best_entry)
        diary.add(DiaryEntry.new("Monday", "one two three"))
        diary.add(DiaryEntry.new("Monday", "one two three four"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end
  end
end
