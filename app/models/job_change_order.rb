class JobChangeOrder < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
end
