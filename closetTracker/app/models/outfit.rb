class Outfit < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :groups
end
