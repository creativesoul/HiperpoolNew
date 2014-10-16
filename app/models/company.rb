class Company < ActiveRecord::Base
  
  validates :first_name, :last_name, :company_name, :position, :email, :presence => true
end
