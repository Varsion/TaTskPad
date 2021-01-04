class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true

  	# 生成密钥
  	def new_token
  		SecureRandom.urlsafe_base64
  	end
  	# 返回指定字符串的哈希摘要
	def digest string
	   	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

end
