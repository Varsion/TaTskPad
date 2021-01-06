class UsersController < ApplicationController
	before_action :true_user?, only: [:edit, :update]
	# 注册新用户
	def new
		@user = User.new
	end

	# 注册新用户
	def create
		@user = User.new(user_params)
		if @user.save
			# 发送激活邮件
			# @user.send_verify_mail
			flash[:info] = "Please check your email to activate your account."
			redirect_to root_url
		else
			render 'new'
		end
	end

	# 修改用户个人信息
	def edit
		@user = User.find(params[:id])
	end

	# 更新用户个人信息
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Profile Update Success"
			redirect_to users_path
		else
			render 'edit'
		end
	end


	def verify 
		email 	= request.GET['email']
		vercode = request.GET['code']

		@user = User.find_by(email: email)
		if @user.verify_account vercode
			flash[:success] = "Account verification succeeded"
			redirect_to login_path
		else
			render 'new'
		end
	end

	# 用户个人信息
	def index
		@user = current_user
	end

	private

	# 健壮性参数
	def user_params
		params.require(:user).permit(:name, :email, :nickname, :password, :password_confirmation)
	end

	# 确保修改的是当前用户的信息
	def true_user?
		@user = User.find(params[:id])
    	redirect_to root_url unless current_user? @user
	end
end