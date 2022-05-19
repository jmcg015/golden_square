class MusicTracker
  def initialize
    @songs = []
  end

  def add(song)
    fail "Song already added to list" if @songs.include?(song)
    @songs.push(song)
  end

  def show_songs
    @songs
  end
end
