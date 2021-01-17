class Session < ApplicationRecord
	# 一个组织会话属于一个用户 也只属于一个组织
	belongs_to :user
	belongs_to :tenant
	has_many :tasks

end