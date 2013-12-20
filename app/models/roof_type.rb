class RoofType < ActiveRecord::Base
  has_many :new_roof_type, :class_name => 'JobSite', foreign_key: :new_roof_type_id
  has_many :existing_roof_type, :class_name => 'JobSite', foreign_key: :existing_roof_type_id
  before_destroy :without_dependency

  def without_dependency
    if self.new_roof_type.size() > 0 || self.existing_roof_type.size() > 0
      self.errors.add :base, "The Roof Type be deleted because it has job site associated to it"
    end
    self.errors.blank?
  end
end
