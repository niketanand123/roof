class Asset < ActiveRecord::Base
  belongs_to :job_site
  has_attached_file :asset, :styles => {:large => "640x480", :medium => "300x300>", :thumb => "100x100>"}
end
