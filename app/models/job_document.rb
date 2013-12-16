class JobDocument < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  has_many :job_site, :class_name => 'JobSite'
end
