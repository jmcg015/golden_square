class TodoList
  def initialize
    @todo_list = []
    @completed_tasks = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    @todo_list
  end

  def complete
    @todo_list.each do |todo|
      if todo.done?
        @completed_tasks << todo
      end
    end
    @completed_tasks
  end

  def give_up!
    @todo_list.map do |todo|
      todo.mark_done!
      @completed_tasks << todo
    end
    @completed_tasks
  end
end
