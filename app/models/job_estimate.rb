class JobEstimate < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :assembly, :class_name => 'Assembly', :foreign_key => :master_item_id
  validates :step, numericality: true
  validates :qty, numericality: true
  validates :retail_price, numericality: true
  validates :item_extended, numericality: true
  validates :master_item_id,  presence: true
end
