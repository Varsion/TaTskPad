module TelnetHelper

# 登陆
  def log_in user
    session[:user_id] = user.id
  end

# 获取当前已经登陆的用户
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

# 如果用户已登录，返回 true，否则返回 false
  def logged_in?
    !current_user.nil?
  end

# 注销登陆
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
