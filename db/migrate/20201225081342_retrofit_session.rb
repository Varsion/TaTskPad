class RetrofitSession < ActiveRecord::Migration[6.0]
  def change
  	remove_column :tenants, :user_id , :integer

  	# 1 是普通用户 0是管理员
  	add_column :sessions, :position, :integer, default: 1
  end
end
