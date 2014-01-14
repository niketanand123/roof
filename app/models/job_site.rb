class JobSite < ActiveRecord::Base
    self.table_name = 'job_site'

    has_many :assets, :class_name => 'Asset', :dependent => :destroy
    accepts_nested_attributes_for :assets, :allow_destroy => true

    has_many :job_service_types, :class_name => 'JobServiceType', :dependent => :destroy
    has_many :job_estimates, :class_name => 'JobEstimate', :dependent => :destroy
    has_many :job_call_notes, :class_name => 'JobCallNote', :dependent => :destroy
    has_many :job_tasks, :class_name => 'JobTask', :dependent => :destroy
    has_many :job_change_orders, :class_name => 'JobChangeOrder', :dependent => :destroy
    has_many :job_contacts, :class_name => 'JobContact', :dependent => :destroy
    has_many :job_documents, :class_name => 'JobDocument', :dependent => :destroy
    belongs_to :customer, :class_name => 'Customer', :foreign_key => :customer_id
    belongs_to :estimate_type, :class_name => 'EstimateType', :foreign_key => :estimate_type_id
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :existing_roof_type_id
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :info_taken_by_id
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :new_roof_type_id
    belongs_to :product_color, :class_name => 'ProductColor', :foreign_key => :product_color_id
    belongs_to :product_type, :class_name => 'ProductType', :foreign_key => :product_type_id
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_rep_id

    validates_presence_of :contact_name
    validates :street1,  presence: true, length: { maximum: 100 }
    validates :zip,  presence: true, length: { maximum: 20 }
    validates_format_of :zip, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
    validates :how_many_stories, numericality: true, :allow_blank => true
    validates :contract_price, numericality: true, :allow_blank => true
    validates :deposit_due, numericality: true, :allow_blank => true

    geocoded_by :set_address
    after_validation :geocode

    def set_address
      address = "#{street1}, #{street2}, #{city}, #{state}, US"
    end
    attr_accessor  :unformatted_appointment_date, :unformatted_date_completed, :unformatted_date_taken

    before_save    :format_date_phone

    def format_date_phone
      if self.unformatted_appointment_date !=nil && self.unformatted_appointment_date !=""
        self.job_start_date = Date.strptime(self.unformatted_appointment_date, "%m/%d/%Y").to_time()
      else
        self.job_start_date = nil
      end
      if self.unformatted_date_completed !=nil && self.unformatted_date_completed !=""
        self.date_completed = Date.strptime(self.unformatted_date_completed, "%m/%d/%Y").to_time()
      else
        self.date_completed = nil
      end
      if self.unformatted_date_taken !=nil && self.unformatted_date_taken !=""
        self.date_taken = Date.strptime(self.unformatted_date_taken, "%m/%d/%Y").to_time()
      else
        self.date_taken = nil
      end
      self.phone = self.phone.convert_to_phone
      self.work_phone = self.work_phone.convert_to_phone
      self.mobile_phone = self.mobile_phone.convert_to_phone
    end

end
