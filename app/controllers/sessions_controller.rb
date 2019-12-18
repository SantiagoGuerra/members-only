# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      cookies.permanent[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
      flash[:success] = 'Welcome!'
    else
      # Create an error message.
      flash[:error] = 'Wrong combination'
    end
    redirect_to signup_path
  end

  def destroy
    cookies.delete :user_id
    cookies.delete :remember_token

    redirect_to signup_path
  end
end
