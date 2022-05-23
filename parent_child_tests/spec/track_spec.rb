require "track"

RSpec.describe Track do
  context "initially" do
    it "works" do
      track_1 = Track.new("Idioteque", "Radiohead")
      expect(track_1.matches?("Radiohead")).to eq true
    end
  end

end