class Diary
  def initialize
    @entries = []
    @contacts = []
    @tasks = []
    @completed_tasks = []
  end

  def show_entries
    @entries
  end

  def show_contacts
    @contacts.flatten(1)
  end

  def show_tasks
    @tasks
  end

  def add_entry(entry)
    @entries << entry
  end

  def count_words
    @entries.map(&:count_words).sum
  end

  def reading_time(wpm)
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    can_read = @entries.filter { |entry| entry.reading_time <= minutes }
    return can_read.max_by(&:count_words)
  end

  def add_task(task)
    @tasks << task
  end

  def complete_task
    @tasks.each do |task|
      if !task.done?
        task.complete
      end
      @completed_tasks << task
      @tasks.delete(task)
    end
    @completed_tasks
  end

  def add_number
    @entries.each do |entry|
      num = entry.contents.scan(/[07][0-9]{10}/)
      @contacts << num
    end
  end
end
