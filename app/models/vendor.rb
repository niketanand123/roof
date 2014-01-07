class Vendor < ActiveRecord::Base
  belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_rep_id
  validates_presence_of :name
  validates_presence_of :address1
  validates_presence_of :zip1
  alidates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :zip1, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
  validates_format_of :zip2, :with =>  /^\d{5}(-\d{4})?$/, :message => "should be 12345 or 12345-1234",:multiline => true
  validates :gm_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}
  validates :sales_rep_phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}


  before_save    :format_phone
  def format_phone
    self.gm_phone = self.gm_phone.convert_to_phone
    self.sales_rep_phone = self.sales_rep_phone.convert_to_phone
  end
  #before_destroy :without_dependency
  #
  #def without_dependency
  #  if self.job_tasks_entered_by.size() > 0 || self.job_tasks_completed_by.size() > 0
  #    self.errors.add :base, "The Employee cannot be deleted because it has job task associated to it"
  #  end
  #  if self.job_call_notes.size() > 0
  #    self.errors.add :base, "The Employee cannot be deleted because it has job call notes associated to it"
  #  end
  #  self.errors.blank?
  #end
end
