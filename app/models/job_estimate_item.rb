class JobEstimateItem < ActiveRecord::Base
  belongs_to :job_estimate, :class_name => 'JobEstimate', :foreign_key => :job_estimate_id
  belongs_to :assembly, :class_name => 'Assembly', :foreign_key => :master_item_id, :order => "item_description ASC"
  validates :step, numericality: true, :allow_blank => true
  validates :qty, numericality: true
  validates :retail_price, numericality: true
  validates :item_extended, numericality: true
  validates :master_item_id,  presence: true
end
