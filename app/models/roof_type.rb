class RoofType < ActiveRecord::Base



    has_many :job_details, :class_name => 'JobDetail'    
    has_many :job_details, :class_name => 'JobDetail'    
end
