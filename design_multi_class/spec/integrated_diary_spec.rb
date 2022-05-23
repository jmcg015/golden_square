require "diary"
require "diary_entry"
require "todo_task"

RSpec.describe Diary do
  context "when we add objects" do
    it "adds multiple diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Tuesday", "four five six")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.show_entries).to eq [entry_1, entry_2]
    end

    it "adds a todo task" do
      diary = Diary.new
      task_1 = TodoTask.new("Buy food")
      task_2 = TodoTask.new("Buy coffee")
      diary.add_task(task_1)
      diary.add_task(task_2)
      expect(diary.show_tasks).to eq [task_1, task_2]
    end
  end

  context "word counting behaviour" do
    it "returns the number of words in all entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Tuesday", "four five six")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.count_words).to eq 6
    end

    it "calculates the reading time for all entries where it fits exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two")
      entry_2 = DiaryEntry.new("Tuesday", "four five")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.reading_time(2)).to eq 2
    end

    it "calculates the reading time for all entries where don't fit exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three")
      entry_2 = DiaryEntry.new("Tuesday", "four five")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  context "handling task behaviour" do
    it "marks a task as complete" do
      diary = Diary.new
      task_1 = TodoTask.new("Buy food")
      diary.add_task(task_1)
      task_1.complete
      expect(diary.complete_task).to eq [task_1]
      expect(diary.show_tasks).to eq []
    end
  end

  context "handling contact numbers" do
    it "stores the number in an entry with a number" do
      diary = Diary.new
      entry = DiaryEntry.new("Monday", "My number is 07234567891")
      diary.add_entry(entry)
      diary.add_number
      expect(diary.show_contacts).to eq ["07234567891"]
    end

    it "stores multiple numbers in one entry" do
      diary = Diary.new
      entry = DiaryEntry.new("Monday", "My number is 07234567891 and 07899544654")
      entry_2 = DiaryEntry.new("Tuesday", "Another number is 07833636321")
      diary.add_entry(entry)
      diary.add_entry(entry_2)
      diary.add_number
      expect(diary.show_contacts).to eq ["07234567891", "07899544654", "07833636321"]
    end
  end
end
