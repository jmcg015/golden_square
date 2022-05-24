class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    if @task.complete?
      return "- [x] #{@task.title}"
    else
      return "- [ ] #{@task.title}"
    end
  end
end
