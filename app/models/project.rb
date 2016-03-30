class Project < ActiveRecord::Base
	belongs_to :organization
	has_many :employees,:dependent => :delete_all


def get_organization_name
	Organization.where(id: organization_id).first.name
end

def get_employee_name
	Employee.all.where(project_id: id).pluck(:name) 
end

end
