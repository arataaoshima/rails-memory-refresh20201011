class HomeController < ApplicationController

  before_action :check_signed_in, only: [:all_users]

  before_action :block_signed_in, only: [:top]
  before_action :user_paid, only: [:free_trial]

  def top
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.username}の会員情報抹消が完了致しました"
    redirect_to all_users_path
  end

  def free_trial
    @courses = Course.all
  end

  def about
  end

  def mycourse
    @courses = Course.all
    @completed_lectures = Lecture.all
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
    @user.payment = params[:payment]
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

def block_signed_in
  if user_signed_in? && current_user.admin != true
    redirect_to courses_path
  end
end

def user_paid
  if user_signed_in? && current_user.payment == true
    redirect_to "/courses"
  end
end

  def check_admin
    if user_signed_in? && current_user.admin != true
      redirect_to root_path
    end
  end
