class LeadSource < ActiveRecord::Base
    self.table_name = 'lead_source'


    has_many :customers, :class_name => 'Customer'    
end
