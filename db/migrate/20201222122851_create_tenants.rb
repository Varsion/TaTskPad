class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|

    	t.string   :tenant_name, unique: true
    	t.integer  :founder
    	t.text 	   :desc
    	t.datetime :task_start
    	t.datetime :task_end

    	t.timestamps
    end
  end
end
