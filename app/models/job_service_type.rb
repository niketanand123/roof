class JobServiceType < ActiveRecord::Base
    belongs_to :service_type, :class_name => 'ServiceType', :foreign_key => :service_type_id
    belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_id    
end
