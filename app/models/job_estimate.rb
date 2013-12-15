class JobEstimate < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :item_code, :class_name => 'ItemCode', :foreign_key => :master_item_id
  has_many :job_site, :class_name => 'JobSite'
end
