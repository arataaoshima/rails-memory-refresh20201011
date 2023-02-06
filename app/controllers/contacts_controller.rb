class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:show, :edit, :update, :index]
  before_action :check_signed_in, only: [:edit, :update, :destroy,:index]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|

       if current_user
       @contact.email = current_user.email
       end
      @user = @contact.email

      if @contact.save
        NotificationMailer.send_confirm_to_user(@user).deliver
        NotificationMailer.receive_inquiry(@user).deliver
        format.html { redirect_to root_path, notice: 'お問い合わせありがとうございます。3営業日以内にメールにて返信いたします。' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:email, :contact_type, :content, :solved)
    end

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
end
