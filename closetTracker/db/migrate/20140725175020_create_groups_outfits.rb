class CreateGroupsOutfits < ActiveRecord::Migration
  def up
    create_table :groups_outfits, :id => false do |t|
      t.references :groups
      t.references :outfit
    end
  end
  def down
  	drop_table :groups_outfits
  end
end
