class SalesTax < ActiveRecord::Base
  validates :sales_tax, numericality: true, :allow_blank => false
end
