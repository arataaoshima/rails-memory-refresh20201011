class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :check_user_login
  before_action :user_unpaid, only: [:index, :show]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :image, :description, :order)
    end

    def check_user_login
      if !user_signed_in?
        redirect_to root_path
      end
    end

    def user_unpaid
      if user_signed_in? && (current_user.payment != true) && (!current_user.current_payment_period_end_at || Time.at(current_user.current_payment_period_end_at) < (Date.today-1))
        if !@course

        redirect_to "/free_trial"
       elsif @course &&@course.id != 1
         flash[:alert] = "このページは有料プラン限定です。右上のボタンからお手続き下さい"
        redirect_to "/free_trial"
        end
      end
    end

end
