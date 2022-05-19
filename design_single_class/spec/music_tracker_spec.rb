require "music_tracker"

RSpec.describe MusicTracker do
  context "No song added" do
    it "returns an empty list" do
      music_tracker = MusicTracker.new
      expect(music_tracker.show_songs).to eq []
    end
  end

  context "One song provided" do
    it "song is added to song list" do
      music_tracker = MusicTracker.new
      music_tracker.add("Rocketman")
      expect(music_tracker.show_songs).to eq ["Rocketman"]
    end
  end

  context "Two songs provided" do
    it "songs are added to song list" do
      music_tracker = MusicTracker.new
      music_tracker.add("Rocketman")
      music_tracker.add("It's my life")
      expect(music_tracker.show_songs).to eq ["Rocketman", "It's my life"]
    end
  end

  context "Song already listened to" do
    it "song is already in the list" do
      music_tracker = MusicTracker.new
      music_tracker.add("Rocketman")
      expect { music_tracker.add("Rocketman") }.to raise_error "Song already added to list"
    end
  end
end
