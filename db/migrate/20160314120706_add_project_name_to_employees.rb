class AddProjectNameToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :project_name, :string
  end
end
