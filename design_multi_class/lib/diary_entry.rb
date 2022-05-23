class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(" ") + 1
  end
end
