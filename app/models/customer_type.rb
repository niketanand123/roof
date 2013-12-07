class CustomerType < ActiveRecord::Base
    self.table_name = 'customer_type'

    self.inheritance_column = :ruby_type
    has_many :customers, :class_name => 'Customer'    
end
