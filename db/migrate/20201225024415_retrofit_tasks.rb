class RetrofitTasks < ActiveRecord::Migration[6.0]
  def change
  	remove_column :tasks, :group, :string
  	remove_column :tasks, :from, :string
  	# 将任务信息链接到session中，可以有效的避免信息冗余，并有效的将所有信息链接起来 是谁在那个组织中的任务，通过session建立链接
  	add_reference :tasks, :session, foreign_key: true
  end
end
