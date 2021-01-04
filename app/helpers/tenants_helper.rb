module TenantsHelper
	def admin? tenant
		position = Session.find_by(tenant_id: tenant, user_id: current_user.id).position
		if position == 0
			return true
		else
			return false
		end
	end

	def invite_url code
		new_session_url+'?code='+code
	end
end
