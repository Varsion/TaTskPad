class User < ApplicationRecord
	before_save :downcase_email
	# 一个用户可以同时拥有多个组织会话
	has_many :sessions
	# 一个用户通过 会话 拥有 同时属于多个组织
	has_many :tenants, through: :sessions


	
	# 验证用户登陆
	def verify? password
		if self.password == password
			return true
		else
			return false
		end
	end

	private

		def downcase_email
	  		self.email = email.downcase
	  	end
end