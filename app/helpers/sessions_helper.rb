module SessionsHelper

  attr_accessor :current_user

  def current_user(user = nil)
    if cookies[:user_id]
      @current_user ||= User.find_by(id: cookies[:user_id])
    end

    return @current_user
  end
  def logged_in(value=false)
    return value
  end


end

