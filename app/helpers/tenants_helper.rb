module TenantsHelper
	def admin? tenant
		position = Session.find_by(tenant_id: tenant, user_id: current_user.id).position
		if position == 0
			return true
		else
			return false
		end
	end
end
