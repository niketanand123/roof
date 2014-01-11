class JobEstimate < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  has_many :job_estimate_items, :class_name => 'JobEstimateItem', :dependent => :destroy

  validates :price_adjustment, numericality: true, :allow_blank => true
end
