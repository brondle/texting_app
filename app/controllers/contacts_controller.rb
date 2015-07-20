class ContactsController<ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact created."
      redirect_to '/'
    else
      flash[:alert] = "How did you screw that up?"
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :number)
  end

end
