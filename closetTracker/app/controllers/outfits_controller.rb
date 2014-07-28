class OutfitsController < ApplicationController
  def new
    @title = "Upload A New Outfit"
    @outfit = Outfit.new
    @contacts = Contact.all
    @names = []
    Contact.all.each do |c|
      @names << [c.name, c.id]
    end 
  end
  def create
    @new_outfit = Outfit.new(:date_time => DateTime.now, :filename => params[:uploaded_outfit])
    @new_outfit.contacts << Contact.find(params[:contact_id])
    if @new_outfit.save
      redirect_to outfits_path
    else
   	render :controller => :outfits, :action => :new
    end	
  end
  def index
  	@all_outfits = Outfit.all
  	@title = "All Your Outfits"
  end
  private
  def outfit_params
    params.require(:outfit).permit(:date_time, :filename, :contact_ids => [])
  end
end
