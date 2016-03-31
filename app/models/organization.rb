require "csv"
class Organization < ActiveRecord::Base
  has_many :employees,:dependent => :delete_all
  has_many :projects,:dependent => :delete_all
  serialize :organization_ids, Array

  def self.to_csv(options={})
    CSV.generate(options) do |row|
      row << ["Organization Name" ,"Location", "Project Name", "Employee Name"]
      all.each do |org|
        org.projects.each do |project|
           project.employees.each do |employee|
            row <<[org.name,org.location, project.project_name, employee.name]
          end
        end
      end
    end
  end

  def get_project_name
    if Project.where(organization_id: self.id).present?
      Project.all.where(organization_id: id).pluck(:project_name).each do |project_name|
        project_name
      end
    else
      nil
    end
  end
end