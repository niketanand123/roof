class Assembly < ActiveRecord::Base
  has_many :assembly_items, :class_name => 'AssemblyItem', :dependent => :destroy
  has_many :job_estimate_items, :class_name => 'JobEstimateItem', :foreign_key => 'master_item_id'
  validates_presence_of :master_item
  validates_presence_of :item_description
  before_save    :format_date
  attr_accessor  :unformatted_build_date
  before_destroy :without_dependency
  validates :master_item,  presence: true, length: { maximum: 50 }
  validates :item_description,  presence: true, length: { maximum: 300 }

  default_scope :order => "item_description ASC"
  def without_dependency
    if self.job_estimate_items.size() > 0
      self.errors.add :base, "The Assembly cannot be deleted because it has job estimate associated to it"
    end
    self.errors.blank?
  end

  def format_date
    if self.unformatted_build_date != nil && self.unformatted_build_date != ""
      self.build_date = Date.strptime(self.unformatted_build_date, "%m/%d/%Y").to_time()
    else
      self.build_date = nil
    end
  end
end
