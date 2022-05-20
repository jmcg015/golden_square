require "todo"
require "todo_list"

RSpec.describe TodoList do
  context "when we add todos to todo list" do
    it "adds the todos to the todo list and returns an incomplete list of all tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Buy food")
      todo_2 = Todo.new("Buy coffee")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end

    it "returns a list of all completed tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Buy food")
      todo_2 = Todo.new("Buy coffee")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq [todo_1]
    end

    it "marks all tasks as complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Buy food")
      todo_2 = Todo.new("Buy coffee")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.give_up!).to eq [todo_1, todo_2]
    end
  end
end
