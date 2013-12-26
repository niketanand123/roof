class JobContact < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :contact_type, :class_name => 'ContactType', :foreign_key => :contact_type_id
end
