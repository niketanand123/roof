class Company < ActiveRecord::Base
  has_many :customers, :class_name => 'Customer', :dependent => :destroy

end
