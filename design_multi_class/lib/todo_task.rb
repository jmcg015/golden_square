class TodoTask
  def initialize(task)
    @task = task
    @is_complete = false
  end

  def task
    @task
  end

  def complete
    @is_complete = true
  end

  def done?
    @is_complete
  end
end
