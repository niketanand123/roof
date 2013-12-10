class Employee < ActiveRecord::Base



    has_many :customers, :class_name => 'Customer'    
    has_many :job_details, :class_name => 'JobDetail'    
    has_many :job_details, :class_name => 'JobDetail'    
    has_many :job_details, :class_name => 'JobDetail'    
end
