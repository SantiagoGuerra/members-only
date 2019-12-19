# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      cookies.permanent[:user_id] = user.id
      remember_token = User.generate_unique_secure_token
      user.update_attribute(:remember_token, remember_token)
      cookies.permanent[:remember_token] = remember_token
      flash[:success] = 'Welcome!'
      redirect_to posts_path
    else
      # Create an error message.
      flash[:error] = 'Wrong combination'
      redirect_to signup_path
    end
  end

  def destroy
    cookies.delete :user_id
    cookies.delete :remember_token
    @current_user = nil
    redirect_to signup_path
  end
end
