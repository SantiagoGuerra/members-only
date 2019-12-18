# frozen_string_literal: true

module SessionsHelper
  attr_accessor :current_user

  def current_user(_user = nil)
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]

    @current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
