class JobSite < ActiveRecord::Base
    self.table_name = 'job_site'
    validates_presence_of :contact_name
    belongs_to :customer, :class_name => 'Customer', :foreign_key => :customer_id
end
