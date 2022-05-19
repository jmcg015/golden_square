class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    words.length
  end

  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    no_words_we_can_read = wpm * minutes
    start_at = @furthest_word_read
    end_at = @furthest_word_read + no_words_we_can_read
    word_list = words[start_at, end_at]
    if end_at >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    word_list.join(" ")
  end

  private

  def words
    @contents.split(" ")
  end
end

# diary = DiaryEntry.new("Monday", "Example " * 10000)
# p diary.count_words
# p diary.reading_time(100)

entry = DiaryEntry.new("Monday", "One two three four five six seven eight nine ten.")
entry.reading_chunk(1, 4)
