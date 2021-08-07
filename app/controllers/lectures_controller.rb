class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_unpaid, only: [:show]
  before_action :check_admin, only: [:edit, :update, :destroy, :new, :create, :index]
  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @lecture = Lecture.find(params[:id])
    course_id = @lecture.course_id
    @slide_indicator_number = @lecture.slides[1,@lecture.slides.length-1]

    @prev_lecture = Lecture.find_by(course_id:course_id, order: @lecture.order-1)
    @next_lecture = Lecture.find_by(course_id:course_id, order: @lecture.order+1)

    @course = Course.find(@lecture.course_id)

    @task_sheet_link = SheetLink.find_by(lecture_id: @lecture.id, sheet_type:"task")
    @answer_sheet_link = SheetLink.find_by(lecture_id: @lecture.id, sheet_type:"answer")
    @answer_code_link = SheetLink.find_by(lecture_id: @lecture.id, sheet_type:"code")

  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  def complete
    @lecture = Lecture.find_by(course_id: params[:course_id], order: params[:order])
    next_lecture = Lecture.find_by(course_id: params[:course_id], order: @lecture.order+1)
    @lecture_user = LectureUser.new(lecture_id: @lecture.id, user_id: current_user.id)
    @lecture_user.save
    if next_lecture
    redirect_to "/lectures/#{next_lecture.id}"
    else
    redirect_to courses_path
    end
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_params
      params.require(:lecture).permit(:name, :order, :course_id, :video, :description)
    end

    def user_unpaid
      if user_signed_in? && current_user.payment != true
        if @lecture.course.order != 1
          flash[:alert] = "このページは有料プラン限定です。右上のボタンからお手続き下さい"
         redirect_to "/categories"
        end
      end
    end

    def check_admin
        if user_signed_in? && current_user.admin != true
          redirect_to root_path
     end
    end

end
