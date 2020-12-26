class Tenant < ApplicationRecord
	# 一个组织拥有多个员工会话
	has_many :sessions
	# 即 一个组织 通过 会话 而 拥有多个员工
	has_many :users, through: :sessions
end