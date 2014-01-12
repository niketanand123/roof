class JobRoofType < ActiveRecord::Base
  belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :new_roof_type_id
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_id
end
