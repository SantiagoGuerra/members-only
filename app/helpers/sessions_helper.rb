# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
