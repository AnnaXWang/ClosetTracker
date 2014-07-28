class Outfit < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  default_scope order: 'created_at DESC'
  def create_outfit new_outfit
  	File.open(Rails.root.join('app', 'assets', 'images', new_outfit.original_filename), 'wb') do |file|
  	  file.write(new_outfit.read)
    end
  end
  validates :filename, presence:true
end
