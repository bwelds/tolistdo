class AddPriorityDefaultValueToItem < ActiveRecord::Migration
  
  def up
  	change_column :items, :priority, :integer, :default => 0
  end
  def down
    change_column :items, :priority, :integer, :default => nil
  end
end
