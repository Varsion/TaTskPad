class SessionsController < ApplicationController
	before_action :logged_in_user

	# 组织会话
	def index
		@session = current_user.sessions
	end

	def new
		code = request.GET['code']
		@tenant = Tenant.find_by(invitation_code: code)
		if @tenant.sessions.create(user_id: current_user.id)
			flash[:success] = "Join Succes, You are already a member of this organization"
			redirect_to tenants_path
		else
			flash[:warning] = "Join Fail, Please contact the administrator for a new invitation link!"
			redirect_to root_path
		end
	end

	def create
		# 建立组织会话
	end

	def destroy
		# 需要获取这个组织的ID 和 当前用户
		# 或者只获取该 session 的ID
	end

end
