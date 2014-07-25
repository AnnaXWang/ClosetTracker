class Outfit < ActiveRecord::Base
  belongs_to :contact
  default_scope order: 'created_at DESC'
  def create_outfit new_outfit
  	File.open(Rails.root.join('app', 'assets', 'images', new_outfit.original_filename), 'wb') do |file|
  	  file.write(new_outfit.read)
    end
  end
  validates :file_name, presence:true
end
