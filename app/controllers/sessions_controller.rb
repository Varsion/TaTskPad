class SessionsController < ApplicationController
	# 组织会话
	def index
		@session = Session.all
	end

	def new
		# 加入组织
	end

	def create
		# 建立组织会话
	end

	def destroy
		# 退出组织会话
	end

end
