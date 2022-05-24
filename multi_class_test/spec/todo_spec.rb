require "todo"

RSpec.describe Todo do
  context "when adding a todo task" do
    it "returns the task as a string" do
      todo = Todo.new("Buy food")
      expect(todo.task).to eq "Buy food"
    end
  end

  describe "@mark_done!" do
    it "marks the task as complete" do
      todo = Todo.new("Buy food")
      expect(todo.mark_done!).to eq true
    end
  end

  describe "@done" do
    it "returns true if task is marked as complete" do
      todo = Todo.new("Buy food")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end
