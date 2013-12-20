class ContactType < ActiveRecord::Base
  has_many :job_contacts, :class_name => 'JobContact', foreign_key: :contact_type_id
  before_destroy :without_dependency

  def without_dependency
    if self.job_contacts.size() > 0
      self.errors.add :base, "The Contact Type cannot be deleted because it has job contact associated to it"
    end
    self.errors.blank?
  end
end
