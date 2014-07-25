class OutfitsController < ApplicationController
  def new
    @title = "Upload A New Outfit"
	  @outfit = Outfit.new
  end
  def create
    if params[:outfit]
      @new_outfit = Outfit.new(:date_time => DateTime.now, :filename => params[:outfit][:uploaded_outfit].original_filename)
      if @new_outfit.save
        @new_outfit.create_outfit(params[:outfit][:uploaded_outfit]) 
      else
     	render :controller => :outfits, :action => :new
      end	
    else
      render :controller => :outfits, :action => :new
  	end
  end
  def show
  	@all_outfits = Outfit.all
  	@title = "All Your Outfits"
  end
end
