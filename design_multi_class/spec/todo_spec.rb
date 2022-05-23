require "todo_task"

RSpec.describe TodoTask do
  it "returns the task as a string" do
    task = TodoTask.new("Buy food")
    expect(task.task).to eq "Buy food"
  end

  it "Marks the task as complete" do
    task = TodoTask.new("Buy food")
    expect(task.complete).to eq true
  end

  it "Returns false if task is incomplete" do
    task = TodoTask.new("Buy food")
    expect(task.done?).to eq false
  end

  it "Returns true if task is complete" do
    task = TodoTask.new("Buy food")
    task.complete
    expect(task.done?).to eq true
  end
end
