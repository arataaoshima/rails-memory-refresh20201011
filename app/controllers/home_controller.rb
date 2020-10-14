class HomeController < ApplicationController
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
