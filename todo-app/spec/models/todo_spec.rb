require 'rails_helper'

RSpec.describe Todo, :type => :model do
  def multiple_tasks(todo_list)
    3.times{todo_list.tasks.build(title: 'test', description: 'this is the description')}
  end

  context 'A todo list with all information should' do
    before(:each) do
      @todo = Todo.create(title: 'todo_list')
    end
    it 'should have a title' do
      @todo.title = nil
      expect(@todo.valid?).to eq(false)
    end

    it 'should have associated tasks' do
      @todo.tasks << Task.new(title: 'test', description: 'descriiiiption')
      expect(@todo.tasks.length).to eq(1)
    end

    it 'should have a has_many relationship with tasks' do
      multiple_tasks(@todo)
      expect(@todo.tasks.size).to be > 2
    end

    it '#add_task(task) should add tasks' do
      # let(:new_task) {
      #   Task.new(title: 'test', description: 'rescriiiption')
      # }
      new_task = Task.new(title: 'test', description: 'rescriiiption')
      @todo.add_task(new_task)
      expect(@todo.tasks.last).to eq(new_task)
    end
  end

  context 'A todo list should be able to read/write status of its tasks' do
    before(:each) do
      @todo = Todo.new(title: 'todo_list')
    end
    it '#complete_all! should mark all tasks as complete' do
      multiple_tasks(@todo)
      @todo.complete_all!
      expect(@todo.tasks.where(status: "Incomplete").size).to be(0)
    end

    it '#complete? should return a boolean that checks if a task is completed' do
      @todo.tasks.build(title: 'incomplete_task', description: 'this is not done', status: "Incomplete")
      expect(@todo.tasks.last.complete?).to be(false)
    end

    it '#complete_tasks should return an array of its completed tasks' do
      multiple_tasks(@todo)
      @todo.complete_all!
      expect(@todo.completed_tasks).to eq(@todo.tasks)
    end

    it '#incomplete_tasks should return an array of its incomplete tasks' do
      multiple_tasks(@todo)
      @todo.complete_all!
      expect(@todo.incompleted_tasks.length).to eq(0)
    end
  end
end


