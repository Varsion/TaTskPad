class AddAttrToTask < ActiveRecord::Migration[6.0]
  def change
  	# 移除 弃用字段
  	remove_column :tasks, :to , :integer
  	# 新增 任务状态字段 默认为 未完成
  	add_column :tasks, :status, :boolean, default: false
  end
end
