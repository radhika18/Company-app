class AddProjectIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :project_id, :string
  end
end
