class Vendor < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => :sales_rep_id
  validates_presence_of :name
  validates_presence_of :address1
  validates_presence_of :zip1
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:allow_blank=> true
  validates_format_of :zip1, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
  validates_format_of :zip2, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
  validates :gm_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}
  validates :sales_rep_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}


  before_save    :format_phone
  def format_phone
    self.gm_phone = self.gm_phone.convert_to_phone
    self.sales_rep_phone = self.sales_rep_phone.convert_to_phone
  end

end
