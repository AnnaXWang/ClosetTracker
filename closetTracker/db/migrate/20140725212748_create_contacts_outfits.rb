class CreateContactsOutfits < ActiveRecord::Migration
  def up
    create_table :contacts_outfits do |t|
      t.integer :contact_id
      t.integer :outfit_id
    end
  end
  def down
  	drop_table :contacts_outfits
  end
end
