require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "returns all tasks" do
    task_list = TaskList.new
    task = double :task
    expect(task_list.add(task)).to eq [task]
  end

  it "checks if tasks are complete" do
    task_list = TaskList.new
    task_1 = double :task, mark_complete: true, complete?: true
    task_2 = double :task, mark_complete: true, complete?: true
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end
end
