class LinkTaskAndTenant < ActiveRecord::Migration[6.0]
  def change
  	add_reference :tasks, :tenant, foreign_key: true
  end
end
