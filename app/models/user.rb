class User < ApplicationRecord

	attr_accessor :activation_token

	# 邮件规则验证
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_save :downcase_email
	before_create :create_token_digest

	# 使用更安全的密码 依赖于 数据库 password_digest 字段
	# 依赖于 bcrypt gem
	# 获得一对虚拟属性 password 和 password_confirmation 创建用户对象时会检查该属性是否匹配
	# 获得 authenticate 用户检查用户密码
	has_secure_password

	validates :email, presence: true , length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true

    validates :name , presence: true , length: {maximum: 50}

    # 更新个人信息时，允许密码临时为nil
  	validates :password , presence: true, length: { minimum: 6 }, allow_nil: true

	# 一个用户可以同时拥有多个组织会话
	has_many :sessions
	# 一个用户通过 会话 拥有 同时属于多个组织
	has_many :tenants, through: :sessions
	

	# 发送激活邮件
	def send_verify_mail
		AccountMailer.verify_account(self).deliver_now
	end

	def is_actived?
		self.actived
	end

	private
		# 使邮箱保持小写
		def downcase_email
	  		self.email = email.downcase
	  	end

	  	# 建立邮箱验证token
	  	def create_token_digest
		  	# self.activation_token = User.new_token
		  	self.activation_disest = digest(new_token)
	  	end
end