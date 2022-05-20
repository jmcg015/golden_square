class Todo
  def initialize(task) # task is a string
    @task = task
    @completed_tasks = Hash.new(:incomplete)
  end

  def task
    @task
  end

  def mark_done!
    task = @task
    @completed_tasks[task] = :complete
  end

  def done?
    task = @task
    @completed_tasks[task] == :complete ? true : false
  end
end
