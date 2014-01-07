class ProductColor < ActiveRecord::Base
    has_many :job_sites, :class_name => 'JobSite', foreign_key: :product_color_id
    before_destroy :without_dependency
    validates_presence_of :product_color
    def without_dependency
      if self.job_sites.size() > 0
        self.errors.add :base, "The Product color cannot be deleted because it has job site associated to it"
      end
      self.errors.blank?
    end
end
