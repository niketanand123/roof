class JobSite < ActiveRecord::Base
    self.table_name = 'job_site'

    has_many :job_service_types, :class_name => 'JobServiceType'
    has_many :job_estimates, :class_name => 'JobEstimate'
    has_many :job_call_notes, :class_name => 'JobCallNote'
    belongs_to :customer, :class_name => 'Customer', :foreign_key => :customer_id
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :assign_to_id
    belongs_to :estimate_type, :class_name => 'EstimateType', :foreign_key => :estimate_type_id
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :existing_roof_type_id
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :info_taken_by_id
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :new_roof_type_id
    belongs_to :product_color, :class_name => 'ProductColor', :foreign_key => :product_color_id
    belongs_to :product_type, :class_name => 'ProductType', :foreign_key => :product_type_id
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_rep_id

    validates_presence_of :contact_name
    geocoded_by :set_address
    after_validation :geocode

    def set_address
      address = "#{street1}, #{street2}, #{city}, #{state}, US"
    end


end
