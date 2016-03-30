class Employee < ActiveRecord::Base
	belongs_to :organization
	belongs_to :project



def get_organization_name
	Organization.where(id: organization_id).first.name
end

def get_project_name
	Project.where(id: project_id).first.project_name
end

end
