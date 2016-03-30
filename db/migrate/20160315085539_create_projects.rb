class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :employee_id
      t.string :organization_id

      t.timestamps null: false
    end
  end
end
