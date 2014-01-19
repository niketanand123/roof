class JobCallNote < ActiveRecord::Base
  belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_site_id
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id

  before_save    :format_date
  attr_accessor  :unformatted_call_date

  def format_date
    if self.unformatted_call_date !=nil && self.unformatted_call_date !=""
      self.call_date = Date.strptime(self.unformatted_call_date, "%m/%d/%Y").to_time()
    else
      self.call_date = nil
    end
  end
end
