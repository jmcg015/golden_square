class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track
  end

  def all
    @tracks
  end
  
  def search(keyword) 
    @tracks.map { |track| track if track.matches? }
  end
end