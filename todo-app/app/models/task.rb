class Task < ActiveRecord::Base
  belongs_to :todo
  validates_presence_of :description

  def mark_as_complete!
    self.status = "Complete"
  end

  def mark_as_incomplete!
    self.status = "incomplete"
  end

  def complete?
    if self.status == 'Complete'
      return true
    else
      return false
    end
  end
end
