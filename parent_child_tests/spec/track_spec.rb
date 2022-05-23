require "track"

RSpec.describe Track do
  describe "@matches?" do
    it "returns true if keyword is part of the artist or track" do
      track_1 = Track.new("Idioteque", "Radiohead")
      expect(track_1.matches?("Radio")).to eq true
    end
  end
end
