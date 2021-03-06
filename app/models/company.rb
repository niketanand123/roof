class Company < ActiveRecord::Base
  has_many :customers, :class_name => 'Customer'
  validates :name,  presence: true, length: { maximum: 255 }
  validates :address,  presence: true, length: { maximum: 255 }
  validates :zip,  presence: true, length: { maximum: 255 }
  validates_format_of :zip, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
  validates :main_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or ten digits in length, or blank."}
  validates :fax_number, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Fax number must be either seven or ten digits in length, or blank."}
  validates_format_of :main_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:allow_blank=> true
  before_save    :format_phone
  before_destroy :without_dependency
  def without_dependency
    if self.customers.size() > 0
      self.errors.add :base, "The company cannot be deleted because it has customers associated to it"
    end
    self.errors.blank?
  end
  def format_phone
    self.main_phone = self.main_phone.convert_to_phone
  end
end
