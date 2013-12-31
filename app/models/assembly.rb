class Assembly < ActiveRecord::Base
  has_many :assembly_items, :class_name => 'AssemblyItem', :dependent => :destroy
  validates_presence_of :master_item
  validates_presence_of :item_description
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
