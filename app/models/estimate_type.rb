class EstimateType < ActiveRecord::Base



    has_many :job_estimate, :class_name => 'JobEstimate'
end
