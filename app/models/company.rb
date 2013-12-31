class Company < ActiveRecord::Base
    self.table_name = 'company'

    has_many :job_sites, :class_name => 'JobSite', :dependent => :destroy

end
