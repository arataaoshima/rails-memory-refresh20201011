class SheetLinksController < ApplicationController
  before_action :set_sheet_link, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy, :new, :create, :show]
  before_action :check_signed_in, only: [:edit, :update, :destroy, :new, :create, :show]
  # GET /sheet_links
  # GET /sheet_links.json
  def index
    @sheet_links = SheetLink.all
  end

  # GET /sheet_links/1
  # GET /sheet_links/1.json
  def show
  end

  # GET /sheet_links/new
  def new
    @sheet_link = SheetLink.new
  end

  # GET /sheet_links/1/edit
  def edit
  end

  # POST /sheet_links
  # POST /sheet_links.json
  def create
    @sheet_link = SheetLink.new(sheet_link_params)

    respond_to do |format|
      if @sheet_link.save
        format.html { redirect_to @sheet_link, notice: 'Sheet link was successfully created.' }
        format.json { render :show, status: :created, location: @sheet_link }
      else
        format.html { render :new }
        format.json { render json: @sheet_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheet_links/1
  # PATCH/PUT /sheet_links/1.json
  def update
    respond_to do |format|
      if @sheet_link.update(sheet_link_params)
        format.html { redirect_to @sheet_link, notice: 'Sheet link was successfully updated.' }
        format.json { render :show, status: :ok, location: @sheet_link }
      else
        format.html { render :edit }
        format.json { render json: @sheet_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheet_links/1
  # DELETE /sheet_links/1.json
  def destroy
    @sheet_link.destroy
    respond_to do |format|
      format.html { redirect_to sheet_links_url, notice: 'Sheet link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheet_link
      @sheet_link = SheetLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sheet_link_params
      params.require(:sheet_link).permit(:title, :url, :lecture_id, :sheet_type)
    end

    def check_admin
      if user_signed_in? && current_user.admin != true
        redirect_to root_path
      end
    end

    def check_signed_in
      if !user_signed_in?
        redirect_to root_path
      end
    end

end
