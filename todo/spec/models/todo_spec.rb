require 'rails_helper'

RSpec.describe Todo, :type => :model do
  def multiple_tasks(todo_list)
    3.times{todo_list.tasks.build(title: 'test', description: 'this is the description')}
  end

  context 'A todo list with all information should' do
    before(:each) do
      todo = Todo.new(title: 'todo_list')
    end
    it 'should have a title' do
      expect(todo.title = nil).to_not be_valid
    end

    it 'should have associated tasks' do
      todo.tasks.build(title: 'test', description: 'descriiiiption')
      todo.to have(:no).errors_on(:tasks)
    end

    it 'should have a has_many relationship with tasks' do
      multiple_tasks(todo)
      expect(todo.tasks.size).to be > 2
    end

    it '#add_task(task) should add tasks' do
      let(:new_task){
        Task.new(:title 'test', description: 'rescriiiption')
      }
      todo.add_task(:new_task)
      expect(todo.tasks.last).to eq(:new_task)
    end
  end

  context 'A todo list should be able to read/write status of its tasks' do
    before(:each) do
      todo = Todo.new(title: 'todo_list')
    end
    it '#complete_all! should mark all tasks as complete' do
      multiple_tasks(todo)
      todo.complete_all!
      expect(todo.tasks.where(status: "Incomplete").size).to be(0)
    end

    it '#complete? should return a boolean that checks if a task is completed' do
      todo.tasks.build(title: 'incomplete_task', description: 'this is not done', status: "Incomplete")
      expect(todo.tasks.last.complete?).to be(false)
    end

    it '#complete_tasks should return an array of its completed tasks' do
      multiple_tasks(todo)
      todo.complete_all!
      expect(todo.completed_tasks).to eq(todo.tasks)
    end

    it '#complete_tasks should return an array of its completed tasks' do
      multiple_tasks(todo)
      expect(todo.incompleted_tasks).to eq(todo.tasks)
    end
  end
end


