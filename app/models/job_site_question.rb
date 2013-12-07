class JobSiteQuestion < ActiveRecord::Base
    self.table_name = 'job_site_question'


    has_many :job_sites, :class_name => 'JobSite'    
end
