class RemoveProjectNameFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :project_name, :string
  end
end
