class Customer < ActiveRecord::Base
    self.table_name = 'customer'

    self.inheritance_column = :ruby_type
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_person_id    
    belongs_to :company, :class_name => 'Company', :foreign_key => :company_id
    belongs_to :lead_source, :class_name => 'LeadSource', :foreign_key => :lead_source_id
    belongs_to :customer_type, :class_name => 'CustomerType', :foreign_key => :type    
    has_many :job_sites, :class_name => 'JobSite', :dependent => :destroy

    validates :first_name,  presence: true, length: { maximum: 50 }
    validates :last_name,  presence: true, length: { maximum: 50 }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :street1,  presence: true, length: { maximum: 255 }
    validates :zip,  presence: true, length: { maximum: 20 }
    validates_format_of :zip, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
    validates :home_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or ten digits in length, or blank."}
    validates :mobile_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or ten digits in length, or blank."}
    validates :work_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or ten digits in length, or blank."}
    validates :fax, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Fax number must be either seven or ten digits in length, or blank."}

    geocoded_by :set_address
    after_validation :geocode
    before_save    :format_phone

    def format_phone
      self.home_phone = self.home_phone.convert_to_phone
      self.work_phone = self.work_phone.convert_to_phone
      self.mobile_phone = self.mobile_phone.convert_to_phone
    end
    def set_address
      address = "#{street1}, #{street2}, #{city}, #{state}, US"
    end
end
