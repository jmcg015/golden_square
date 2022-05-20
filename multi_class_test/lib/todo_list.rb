class TodoList
  def initialize
    @incomplete_tasks = []
    @completed_tasks = []
  end

  def add(todo)
    @incomplete_tasks << todo
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    @completed_tasks
  end

  def give_up!
    # Marks all todos as complete
  end
end
