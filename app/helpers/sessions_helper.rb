module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if  session[:user_id] #если сессия
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end

  def welcome_message
    "Welcome #{ current_user.name } Guru"
  end

end
