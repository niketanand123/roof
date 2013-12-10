class JobSite < ActiveRecord::Base
    self.table_name = 'job_site'


    has_many :job_service_types, :class_name => 'JobServiceType'    
    belongs_to :customer, :class_name => 'Customer', :foreign_key => :customer_id

    validates_presence_of :contact_name
    geocoded_by :set_address
    after_validation :geocode

    def set_address
      address = "#{street1}, #{street2}, #{city}, #{state}, US"
    end


end
