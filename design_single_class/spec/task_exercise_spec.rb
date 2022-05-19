require "task_exercise"

RSpec.describe TaskTracker do
  context "no tasks given" do
    it "has an empty string" do
      task_tracker = TaskTracker.new
      expect(task_tracker.show_tasks).to eq []
    end
  end

  context "given a task" do
    it "has a task in the list" do
      task_tracker = TaskTracker.new
      task_tracker.add_task("Wash the dishes")
      expect(task_tracker.show_tasks).to eq ["Wash the dishes"]
    end
  end

  context "given two task" do
    it "has 2 task in the list" do
      task_tracker = TaskTracker.new
      task_tracker.add_task("Wash the dishes")
      task_tracker.add_task("Wash the car")
      expect(task_tracker.show_tasks).to eq ["Wash the dishes", "Wash the car"]
    end
  end

  context "complete a task" do
    it "removes the task from the list" do
      task_tracker = TaskTracker.new
      task_tracker.add_task("Wash the dishes")
      task_tracker.add_task("Wash the car")
      task_tracker.complete("Wash the dishes")
      expect(task_tracker.show_tasks).to eq ["Wash the car"]
    end
  end

  context "try to complete a task not on the list" do
    it "fails" do
      task_tracker = TaskTracker.new
      task_tracker.add_task("Wash the dishes")
      expect { task_tracker.complete("Wash the car") }.to raise_error "Task does not exist"
    end
  end
end
