class TelnetController < ApplicationController

	def new
		# 登陆页面
	end

	def create
		user = User.find_by(email: params[:telnet][:email].downcase)

	    if user && user.authenticate(params[:telnet][:password])
	    	if user.is_actived?
	    		log_in user
		    	flash[:success] = "Login Success"
		      	redirect_to root_url
	    	else
	    		flash.now[:warning] = 'Account is not activated'
	      		render 'new'
	    	end
	    else
	    	flash.now[:danger] = 'Invalid email/password combination'
	      	render 'new'
	    end
	end

	def destroy
		log_out
		flash[:success] = "Logout Success"
		redirect_to root_url
	end

end
