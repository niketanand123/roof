class TaskType < ActiveRecord::Base
  has_many :job_tasks, :class_name => 'JobTask', foreign_key: :task_type_id
  before_destroy :without_dependency
  validates_presence_of :task_type
  def without_dependency
    if self.job_tasks.size() > 0
      self.errors.add :base, "The Task Type cannot be deleted because it has job task associated to it"
    end
    self.errors.blank?
  end
end
