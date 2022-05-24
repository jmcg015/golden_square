require "task_formatter"

RSpec.describe TaskFormatter do
  context "initially" do
    it "returns the task as incomplete" do
      task = double :task, title: "Buy food", complete?: false
      formatter = TaskFormatter.new(task)
      expect(formatter.format).to eq "- [ ] Buy food"
    end
  end

  it "formats a complete task" do
    task = double :task, title: "Buy food", complete?: false
    formatter = TaskFormatter.new(task)
    expect(task).to receive(:complete?).and_return true
    expect(formatter.format).to eq "- [x] Buy food"
  end
end
