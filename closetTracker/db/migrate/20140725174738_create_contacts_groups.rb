class CreateContactsGroups < ActiveRecord::Migration
  def up
    create_table :contacts_groups, :id => false do |t|
      t.references :contact
      t.references :group
    end
  end
  def down
  	drop_table :contacts_groups
  end
end
