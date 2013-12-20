class JobStatus < ActiveRecord::Base
  has_many :job_sites, :class_name => 'JobSite', foreign_key: :job_status_id
  before_destroy :without_dependency

  def without_dependency
    if self.job_sites.size() > 0
      self.errors.add :base, "The Job Status cannot be deleted because it has job site associated to it"
    end
    self.errors.blank?
  end
end
