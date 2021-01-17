class LinkTenantAndUser < ActiveRecord::Migration[6.0]
  def change
  	remove_column :tenants, :founder , :string

  	add_reference :tenants, :user, foreign_key: true
  end
end
