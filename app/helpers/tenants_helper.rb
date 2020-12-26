module TenantsHelper
	def is_admin?
		# 查看当前用户在当前组织中是否是管理员 即 session.position = 0
	end
end
