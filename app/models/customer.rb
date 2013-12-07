class Customer < ActiveRecord::Base
    self.table_name = 'customer'

    self.inheritance_column = :ruby_type
    belongs_to :sales_person, :class_name => 'SalesPerson', :foreign_key => :sales_person_id    
    belongs_to :company, :class_name => 'Company', :foreign_key => :company_id    
    belongs_to :lead_source, :class_name => 'LeadSource', :foreign_key => :lead_source_id    
    belongs_to :customer_type, :class_name => 'CustomerType', :foreign_key => :type
    validates :first_name,  presence: true, length: { maximum: 50 }
    validates :last_name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true

    #geocoded_by :street1

end

