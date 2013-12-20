class ServiceType < ActiveRecord::Base
    has_many :job_service_types, :class_name => 'JobServiceType', foreign_key: :service_type_id
    before_destroy :without_dependency

    def without_dependency
      if self.job_service_types.size() > 0
        self.errors.add :base, "The Service type cannot be deleted because it has job site associated to it"
      end
      self.errors.blank?
    end
end
