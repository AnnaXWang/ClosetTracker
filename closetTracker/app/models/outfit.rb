class Outfit < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  default_scope order: 'created_at DESC'
  has_attached_file :photo, :path => ":rails_root/public/system/:attachment /:id/:style /:filename",
:url =>  "/system/:attachment/:id/:style/:filename", 
:styles  => { :small => "100x100#", :large => "500x500>" } 

  def create_outfit new_outfit
  	File.open(Rails.root.join('app', 'assets', 'images', new_outfit.original_filename), 'wb') do |file|
  	  file.write(new_outfit.read)
    end
  end
  validates :filename, presence:true
  validates :photo, :attachment_presence => true
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
end
