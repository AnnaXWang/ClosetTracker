class CreateOutfits < ActiveRecord::Migration
  def up
    create_table :outfits do |t|
      t.references :user
      t.string :filename
      t.timestamps
    end
  end
  def down
  	drop_table :outfits
  end
end
