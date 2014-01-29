class JobTask < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :user, :class_name => 'User', :foreign_key => :entered_by_id
  belongs_to :user, :class_name => 'User', :foreign_key => :created_by_id
  belongs_to :task_type, :class_name => 'TaskType', :foreign_key => :task_type_id

  before_save    :format_date
  attr_accessor  :unformatted_target_date
  attr_accessor  :unformatted_date_completed

  def format_date
    if self.unformatted_target_date !=nil && self.unformatted_target_date !=""
      self.target_date = Date.strptime(self.unformatted_target_date, "%m/%d/%Y").to_time()
    else
      self.target_date = nil;
    end
    if self.unformatted_date_completed !=nil && self.unformatted_date_completed != ""
      self.date_completed = Date.strptime(self.unformatted_date_completed, "%m/%d/%Y").to_time()
    else
      self.date_completed = nil;
    end
  end
end
