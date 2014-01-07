class CustomerType < ActiveRecord::Base
    self.table_name = 'customer_type'

    self.inheritance_column = :ruby_type
    has_many :customers, :class_name => 'Customer', foreign_key: :type
    before_destroy :without_dependency

    validates :type,  presence: true, length: { maximum: 100 }

    def without_dependency
      if self.customers.size() > 0
        self.errors.add :base, "The Customer Type cannot be deleted because it has customer associated to it"
      end
      self.errors.blank?
    end
end
