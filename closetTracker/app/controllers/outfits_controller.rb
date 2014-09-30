class OutfitsController < ApplicationController
  def index
    @all_outfits = Outfit.all
    @title = "All Your Outfits"
  end
  def new
    @title = "Upload A New Outfit"
    @contacts = Contact.all
    @outfit = Outfit.new
  end
  def create
    @outfit_to_make = Outfit.new(outfit_params)
    @outfit_to_make.contacts << Contact.find(params[:contacts])
    if @outfit_to_make.save	
      redirect_to :action => :index
    else
      redirect_to :action => :new
    end
  end
  private
  def outfit_params 
    params.require(:outfit).permit(:date_time, :photo, :contacts)
  end
end
