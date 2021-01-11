class TasksController < ApplicationController
	def index
		
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = "The task was created successfully"
			redirect_back(fallback_location: root_path)
		else
			flash[:danger] = "Some error occurred"
			redirect_back(fallback_location: root_path)
		end
	end

	# 将任务标记为完成
	def finish
		if Task.find(params[:id]).finish
			flash[:success] = "The task has been marked as complete"
			redirect_back(fallback_location: root_path)
		else
			flash[:danger] = "Some error occurred"
			redirect_back(fallback_location: root_path)
		end
	end

	private
		def task_params
			params.permit(:title, :desc, :color, :start, :end, :session_id, :tenant_id)
		end
	
end
