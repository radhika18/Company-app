class RemoveEmployeeIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :employee_id, :string
  end
end
