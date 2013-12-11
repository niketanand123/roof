class JobDetail < ActiveRecord::Base


    has_many :job_service_types, :class_name => 'JobServiceType'
    belongs_to :job_site, :class_name => 'JobSite', :foreign_key => :job_id

    belongs_to :employee, :class_name => 'Employee', :foreign_key => :assign_to_id
    belongs_to :estimate_type, :class_name => 'EstimateType', :foreign_key => :estimate_type_id    
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :existing_roof_type_id    
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :info_taken_by_id    
    belongs_to :roof_type, :class_name => 'RoofType', :foreign_key => :new_roof_type_id    
    belongs_to :product_color, :class_name => 'ProductColor', :foreign_key => :product_color_id    
    belongs_to :product_type, :class_name => 'ProductType', :foreign_key => :product_type_id    
    belongs_to :employee, :class_name => 'Employee', :foreign_key => :sales_rep_id    
end
