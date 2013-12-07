class SalesPerson < ActiveRecord::Base
    self.table_name = 'sales_person'


    has_many :customers, :class_name => 'Customer'    
end
