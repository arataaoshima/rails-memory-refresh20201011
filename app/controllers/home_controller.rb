class HomeController < ApplicationController

  before_action :check_signed_in, only: [:all_users]
  before_action :check_admin, only: [:all_users]

  def top
  end

  def about
  end

  def contact
  end

  def all_users
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    @user.username = params[:username]
    @user.email = params[:email]
    @user.admin = params[:admin]
    if @user.save
      #redirect_to "/edit_user/#{@user.id}"
      redirect_to '/all_users'
    else
      render 'edit_user'
    end
  end
end

private


def check_signed_in
  if !user_signed_in?
    redirect_to root_path
  end
end


  def check_admin
    if user_signed_in? && current_user.admin != true
      redirect_to root_path
    end
  end
