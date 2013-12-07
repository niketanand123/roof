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
    #scope :search , lambda {|basedOn, searchText|
    #  search_condition = "%" + searchText + "%"
    #  if basedOn == "Last Name"
    #    debugger
    #    where("last_name LIKE ?", search_condition)
    #  end
    #  if basedOn == "Phone Number"
    #    where("home_phone LIKE ? OR mobile_phone LIKE ? OR work_phone LIKE ?", search_condition, search_condition, search_condition)
    #  end
    #  if basedOn == "Street Address"
    #    where("street1 LIKE ? OR street2 LIKE ?", search_condition, search_condition)
    #  end
    #  if basedOn == "Company Name"
    #    where("company_name LIKE ?", search_condition)
    #  end
    #}

end

