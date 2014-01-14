class UnitOfMeasurement < ActiveRecord::Base
  validates_presence_of :unit
  has_many :assemblies, :class_name => 'Assembly', foreign_key: :uom_id
  has_many :item_codes, :class_name => 'ItemCode', foreign_key: :uom_id
  before_destroy :without_dependency
  def without_dependency
    if self.assemblies.size() > 0
      self.errors.add :base, "The UOM cannot be deleted because it has assemblies associated to it"
    end
    if self.item_codes.size() > 0
      self.errors.add :base, "The UOM cannot be deleted because it has item coded associated to it"
    end
    self.errors.blank?
  end
end
