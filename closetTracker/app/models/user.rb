class User < ActiveRecord::Base 
  has_many :outfits
  has_many :contacts
  has_many :groups
end
