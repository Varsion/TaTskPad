class TelnetController < ApplicationController

	def new
		# 登陆页面
	end

	def create
		user = User.find_by(email: params[:telnet][:email].downcase)

	    if user && user.verify?(params[:telnet][:password])
	    	log_in user
	      	redirect_to root_url
	    else
	    	flash.now[:danger] = 'Invalid email/password combination'
	      	render 'new'
	    end
	end

	def destroy
		log_out
		redirect_to root_url
	end

end
