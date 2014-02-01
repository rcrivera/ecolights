class ContactsController < ApplicationController

  # GET /contacts/1
  # GET /contacts/1.json
  def index
    
  end

  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @header = "Contact Us"
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if ContactMailer.contact_us(@contact).deliver
        format.html { redirect_to action: "index" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :contact_time, :message)
    end
end
