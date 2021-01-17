class ApplicationController < ActionController::Base
	include TelnetHelper

	private 
	# 判断是否登陆
	  def logged_in_user
	    unless logged_in?
	      flash[:danger] = "Please Log in"
	      redirect_to login_url
	    end
	  end
end
