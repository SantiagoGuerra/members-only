# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @post = @user.posts
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome #{params[:user][:name]}"
      cookies.permanent[:user_id] = @user.id
      cookies.permanent[:remember_token] = @user.remember_token
      redirect_to users_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
