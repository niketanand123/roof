class Employee < ActiveRecord::Base
    has_many :customers, :class_name => 'Customer'
    has_many :job_call_notes, :class_name => 'JobCallNote'
    has_many :job_tasks_entered_by, :class_name => 'JobTask', foreign_key: :entered_by_id
    has_many :job_tasks_completed_by, :class_name => 'JobTask', foreign_key: :completed_by_id
    has_many :vendors, :class_name => 'Vendor', foreign_key: :sales_rep_id
    before_destroy :without_dependency

    def without_dependency
      if self.job_tasks_entered_by.size() > 0 || self.job_tasks_completed_by.size() > 0
        self.errors.add :base, "The Employee cannot be deleted because it has job task associated to it"
      end
      if self.job_call_notes.size() > 0
        self.errors.add :base, "The Employee cannot be deleted because it has job call notes associated to it"
      end
      if self.vendors.size() > 0
        self.errors.add :base, "The Employee cannot be deleted because it has vendors associated to it"
      end
      self.errors.blank?
    end
end
