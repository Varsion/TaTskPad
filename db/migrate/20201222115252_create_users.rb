class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :nickname
    	t.string :email, unique: true
    	t.string :password
    	# 邮箱激活码
    	t.string :activation_disest
    	# 账户状态
    	t.boolean :actived, default: false

    	t.timestamps
    end
  end
end
