class AssemblyItem < ActiveRecord::Base
  belongs_to :assembly, :class_name => 'Assembly', :foreign_key => :assembly_id
  has_one :item_code, :class_name => 'ItemCode', :foreign_key => :item_code_id

  before_save    :format_date
  attr_accessor  :unformatted_build_date

  def format_date
    if self.unformatted_build_date !=nil && self.unformatted_build_date !=""
      self.build_date = Date.strptime(self.unformatted_build_date, "%m/%d/%Y").to_time()
    else
      self.build_date = nil
    end
  end
end
