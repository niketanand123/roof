class LeadSource < ActiveRecord::Base
    self.table_name = 'lead_source'
    has_many :customers, :class_name => 'Customer', foreign_key: :lead_source_id
    before_destroy :without_dependency

    def without_dependency
      if self.customers.size() > 0
        self.errors.add :base, "The Lead Source cannot be deleted because it has customer associated to it"
      end
      self.errors.blank?
    end
end
