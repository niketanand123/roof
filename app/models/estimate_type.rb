class EstimateType < ActiveRecord::Base
  has_many :job_sites, :class_name => 'JobSite', foreign_key: :estimate_type_id
  before_destroy :without_dependency
  validates :estimate_type,  presence: true, length: { maximum: 50 }
  def without_dependency
    if self.job_sites.size() > 0
      self.errors.add :base, "The Estimate Type cannot be deleted because it has job site associated to it"
    end
    self.errors.blank?
  end
end
