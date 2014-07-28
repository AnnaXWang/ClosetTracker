class CreateContactsOutfits < ActiveRecord::Migration
  def up
    create_table :contacts_outfits, :id => false do |t|
      t.integer :contact_id
      t.integer :outfit_id
    end
    add_index :contacts_outfits, [:contact_id, :outfit_id]
    add_index :contacts_outfits, [:outfit_id, :contact_id]
  end
  def down
  	drop_table :contacts_outfits
  end
end
