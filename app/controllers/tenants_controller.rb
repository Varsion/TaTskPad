class TenantsController < ApplicationController
	# 组织

	def index
		@tenants = Tenant.all
	end

	def new
		@tenant = Tenant.new
	end

	def create
		@tenant = Tenant.new(tenant_params)
		if @tenant.save
			redirect_to tenant_index
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		# 删除组织
	end

	private
	# 参数
	def tenant_params
		params.require(:user).permit(:tenant_name, :task_start, :task_end)
	end
end
