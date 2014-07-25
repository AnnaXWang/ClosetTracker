class CreateContactsOutfits < ActiveRecord::Migration
  def up
    create_table :contacts_outfits, :id => false do |t|
      t.references :contact
      t.references :outfit
    end
  end
  def down
  	drop_table :contacts_outfits
  end
end
