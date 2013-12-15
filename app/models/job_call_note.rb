class JobCallNote < ActiveRecord::Base
  validates_datetime :call_date_time
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :employee, :class_name => 'Employee', :foreign_key => :employee_id
  has_many :job_site, :class_name => 'JobSite'
end
