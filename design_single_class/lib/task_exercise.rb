class TaskTracker
  def initialize
    @tasks = []
  end

  def show_tasks
    return @tasks
  end

  def add_task(task)
    @tasks.push(task)
  end

  def complete(task)
    fail "Task does not exist" unless @tasks.include?(task)
    @tasks.delete(task)
  end
end
