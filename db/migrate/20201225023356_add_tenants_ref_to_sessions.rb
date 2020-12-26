class AddTenantsRefToSessions < ActiveRecord::Migration[6.0]
  def change
  	remove_column :sessions, :tenant_id, :integer
  	add_reference :sessions, :tenant, foreign_key: true
  end
end
