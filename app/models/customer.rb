class Customer < ActiveRecord::Base
    self.table_name = 'customer'

    self.inheritance_column = :ruby_type
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_person_id    
    belongs_to :company, :class_name => 'Company', :foreign_key => :company_id    
    belongs_to :lead_source, :class_name => 'LeadSource', :foreign_key => :lead_source_id    
    belongs_to :customer_type, :class_name => 'CustomerType', :foreign_key => :type    
    has_many :job_sites, :class_name => 'JobSite'

    validates :first_name,  presence: true, length: { maximum: 50 }
    validates :last_name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true

    geocoded_by :set_address
    after_validation :geocode

    def set_address
      address = "#{street1}, #{street2}, #{city}, #{state}, US"
    end
end
