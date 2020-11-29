class LectureUsersController < ApplicationController
  before_action :set_lecture_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin
  before_action :user_unpaid, only: [:index, :show]
  # GET /lecture_users
  # GET /lecture_users.json
  def index
    @lecture_users = LectureUser.all
  end

  # GET /lecture_users/1
  # GET /lecture_users/1.json
  def show
  end

  # GET /lecture_users/new
  def new
    @lecture_user = LectureUser.new
  end

  # GET /lecture_users/1/edit
  def edit
  end

  # POST /lecture_users
  # POST /lecture_users.json
  def create
    @lecture_user = LectureUser.new(lecture_user_params)

    respond_to do |format|
      if @lecture_user.save
        format.html { redirect_to @lecture_user, notice: 'Lecture user was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_user }
      else
        format.html { render :new }
        format.json { render json: @lecture_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_users/1
  # PATCH/PUT /lecture_users/1.json
  def update
    respond_to do |format|
      if @lecture_user.update(lecture_user_params)
        format.html { redirect_to @lecture_user, notice: 'Lecture user was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_user }
      else
        format.html { render :edit }
        format.json { render json: @lecture_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_users/1
  # DELETE /lecture_users/1.json
  def destroy
    @lecture_user.destroy
    respond_to do |format|
      format.html { redirect_to lecture_users_url, notice: 'Lecture user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_user
      @lecture_user = LectureUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_user_params
      params.require(:lecture_user).permit(:user_id, :lecture_id)
    end

    def check_admin
      if user_signed_in? && current_user.admin != true
        redirect_to root_path
      end
    end

    def user_unpaid
      if user_signed_in? && current_user.payment != true
        redirect_to "/free_trial"
      end
    end
end
