class AddMemCountToGroupTable < ActiveRecord::Migration
  def change
  	add_column :groups, :member_count, :integer
  end
end
