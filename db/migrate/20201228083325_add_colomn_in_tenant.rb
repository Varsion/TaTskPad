class AddColomnInTenant < ActiveRecord::Migration[6.0]
  def change
  	# 添加组织邀请码 以及 软删除状态码
  	add_column :tenants, :invitation_code, :string
  	add_column :tenants, :status, :boolean , default: true
  end
end
