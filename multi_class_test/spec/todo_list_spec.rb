require "todo_list"

RSpec.describe TodoList do
  context "initially" do
    it "returns an empty incomplete todo list" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end
  end
end
