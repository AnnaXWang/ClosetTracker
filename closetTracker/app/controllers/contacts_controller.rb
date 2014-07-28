class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  def new
  	@title = "Create A New Contact"
  	@contact = Contact.new
  end
  def create
	if params[:contact]
	  if Contact.find_by_name(params[:contact][:name])
		redirect_to new_contact_path
	  else
	    @new_contact = Contact.create(contact_params(params[:contact]))
		if @new_contact.save
		  redirect_to contact_path(@new_contact)
		else
		  render :controller => :contacts, :action => :new
		end			
	  end
	end
  end
  def show
	@contact = Contact.find(params[:id])
	@title = Contact.find(params[:id]).name
  end
  private
  def contact_params(params)
	return params.permit(:name)
  end	
end
