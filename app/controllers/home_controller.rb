class HomeController < ApplicationController

  before_action :check_signed_in, only: [:all_users, :current_studies, :current_studies_courses, :course_table, :category_table, :delete_user, :mycourse, :edit_user, :update_user]
  before_action :check_admin, only: [:all_users, :course_table, :category_table, :delete_user, :edit_user, :update_user]
  before_action :block_signed_in, only: [:top]
  before_action :user_paid, only: [:free_trial]


  def top
  end

  def policies
    @policies = Policy.all.order(:order)
  end

  def privacy_policies
    @privacy_policies = PrivacyPolicy.all.order(:order)
  end

  def current_studies
    @categories = Category.all
  end

  def current_studies_courses
    @category = Category.find_by(id: params[:id])
    @courses = @category.courses.where(publish:true)
  end

  def course_table
    @courses = Course.all
  end


  def category_table
    @categories = Category.all
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.username}の会員情報抹消が完了致しました"
    redirect_to all_users_path
  end

  def free_trial
    @courses = Course.where(publish:true)
  end

  def about
  end

  def mycourse
    @courses = Course.where(publish:true)
    @completed_lectures = Lecture.all
  end

  def contact
        @courses = Course.where(publish:true)
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
    redirect_to categories_path
  end
end

def user_paid
  if user_signed_in? && current_user.payment == true
    redirect_to "/categories"
  end
end

  def check_admin
    if user_signed_in? && current_user.admin != true
      redirect_to root_path
    end
  end
