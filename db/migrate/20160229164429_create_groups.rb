class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.text :description
      t.string :members
      t.boolean :joined, :default => false
      t.string :founder 

      t.timestamps
    end
  end
end
