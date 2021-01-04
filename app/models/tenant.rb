class Tenant < ApplicationRecord

	before_create :tenant_code

	# 一个组织拥有多个员工会话
	has_many :sessions
	# 即 一个组织 通过 会话 而 拥有多个员工
	has_many :users, through: :sessions

	# 需要将创建管理员session的方法放在回调中增加数据的一致性

	private
		# 创建组织时自动生成唯一组织邀请码
		def tenant_code
			self.invitation_code = digest(new_token)
		end

end