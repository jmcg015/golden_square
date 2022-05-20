require "todo_list"

RSpec.describe TodoList do
  context "initially" do
    it "returns an empty completed todo list" do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end
  end
end
