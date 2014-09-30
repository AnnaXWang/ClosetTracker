class Contact < ActiveRecord::Base
  has_and_belongs_to_many :outfits

  def contact_matches text
  	if self.name.downcase.include? text.to_s
  		return true
  	end
  end
end
