require "diary"

RSpec.describe Diary do
  context "when initialised" do
    it "returns an empty entry list" do
      diary = Diary.new
      expect(diary.show_entries).to eq []
    end

    it "returns an empty contact list" do
      diary = Diary.new
      expect(diary.show_contacts).to eq []
    end

    it "returns an empty task list" do
      diary = Diary.new
      expect(diary.show_tasks).to eq []
    end
  end
end
