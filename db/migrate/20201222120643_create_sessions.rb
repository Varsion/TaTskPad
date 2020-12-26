class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
    	t.integer :user_id
    	t.integer :tenant_id
    	# 在组织中的状态
    	t.boolean :session_status, default: false

    	t.timestamps
    end
  end
end