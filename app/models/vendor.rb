class Vendor < ActiveRecord::Base
  belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_rep_id
  #before_destroy :without_dependency
  #
  #def without_dependency
  #  if self.job_tasks_entered_by.size() > 0 || self.job_tasks_completed_by.size() > 0
  #    self.errors.add :base, "The Employee cannot be deleted because it has job task associated to it"
  #  end
  #  if self.job_call_notes.size() > 0
  #    self.errors.add :base, "The Employee cannot be deleted because it has job call notes associated to it"
  #  end
  #  self.errors.blank?
  #end
end
