class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    return @entries.map(&:count_words).sum
  end

  def reading_time(wpm)
    fail "WPM must be positive" unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return readable_entries(wpm, minutes).max_by(&:count_words)
  end

  private

  def readable_entries(wpm, minutes)
    return @entries.filter do |entry|
             entry.reading_time(wpm) <= minutes
           end
  end
end
