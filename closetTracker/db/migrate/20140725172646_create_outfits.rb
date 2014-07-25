class CreateOutfits < ActiveRecord::Migration
  def up
    create_table :outfits do |t|
      t.string :filename
      t.datetime :date_time
      t.timestamps
    end
  end
  def down
  	drop_table :outfits
  end
end
