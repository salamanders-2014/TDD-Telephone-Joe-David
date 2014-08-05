class Todo < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :title


  def complete_all!
    self.tasks.each do |task|
      task.status = "Complete"
    end
  end
  def completed_tasks
    completed = []
    self.tasks.each do |task|
      if task.status == 'Complete'
        completed << task
      end
    end
    return completed
  end

  def incompleted_tasks
    incompleted = []
    self.tasks.each do |task|
      if task.status == 'incomplete'
        incompleted << task
      end
    end
    return incompleted
  end

  def add_task(task)
    self.tasks << task
    return self.tasks
  end
end
