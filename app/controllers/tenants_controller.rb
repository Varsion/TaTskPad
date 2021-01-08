class TenantsController < ApplicationController
	layout "tenants_lay" ,except: [:index]
	before_action :logged_in_user
	# 组织

	def index
		@tenants = current_user.tenants
	end

	def new
		@tenant = Tenant.new
	end

	def create
		@tenant = Tenant.new(tenant_params)
		if @tenant.save
			if create_admin @tenant
				redirect_to tenants_path
			else
				@tenant.destroy
				flash[:danger] = "Some error occurred"
				render 'new'
			end
		else
			flash[:danger] = "Some error occurred"
			render 'new'
		end
	end

	def show
		@tenant = Tenant.find(params[:id])
	end

	def edit
		@tenant = Tenant.find(params[:id])
	end

	def update
		@tenant = Tenant.find(params[:id])
		if @tenant.update(tenant_params)
			flash[:success] = "Tenant's info is updated"
			redirect_to tenants_path
		else
			flash[:danger] = "Some error occurred"
			render 'edit'
		end
	end

	def destroy
		tenant = Tenant.find(params[:id])
		if tenant.update(status: false)
			flash[:success] = "Successfully reorganized and dissolved"
			redirect_to tenants_path
		else
			flash[:danger] = "Some error occurred"
			redirect_to tenants_path
		end
	end


	def manage
		@tenant = Tenant.find(params[:id])
	end

	private
	# 参数
	def tenant_params
		params.require(:tenant).permit(:tenant_name, :desc, :task_start, :task_end)
	end

	def admin?
		
	end
	# 简历组织管理员信息
	def create_admin tenant
		tenant.sessions.create(session_status:1, user_id:current_user.id, position:0)
	end
end
