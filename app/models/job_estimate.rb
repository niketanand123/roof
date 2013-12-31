class JobEstimate < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :assembly, :class_name => 'Assembly', :foreign_key => :master_item_id
end
