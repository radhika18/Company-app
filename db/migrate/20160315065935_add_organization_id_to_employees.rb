class AddOrganizationIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :organization_id, :string
  end
end
