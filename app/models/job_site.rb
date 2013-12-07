class JobSite < ActiveRecord::Base
    self.table_name = 'job_site'


    belongs_to :job_site_question, :class_name => 'JobSiteQuestion', :foreign_key => :question_id    
end
