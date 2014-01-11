class ItemCode < ActiveRecord::Base
  has_many :job_estimate_items, :class_name => 'JobEstimateItem', foreign_key: :master_item_id
  before_destroy :without_dependency
  validates :item_code,  presence: true, length: { maximum: 20 }
  validates :item_name,  presence: true, length: { maximum: 100 }

  def without_dependency
    if self.job_estimate_items.size() > 0
      self.errors.add :base, "The Item code cannot be deleted because it has job estimate associated to it"
    end
    self.errors.blank?
  end
end
