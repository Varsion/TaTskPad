class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		# 修改信息页面
	end

	def update
		# 更新个人信息
	end

	def show
		@user = current_user
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end