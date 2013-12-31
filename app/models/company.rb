class Company < ActiveRecord::Base
    self.table_name = 'company'
    has_many :customers, :class_name => 'Customer', :dependent => :destroy

end
