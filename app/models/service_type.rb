class ServiceType < ActiveRecord::Base



    has_many :job_service_types, :class_name => 'JobServiceType'    
end
