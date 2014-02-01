class AddAncestryToCategory < ActiveRecord::Migration
  
  def change
    add_column :categories, :ancestry, :string
  end

  def self.up
    add_index :categories, :ancestry
  end

  def self.down
    remove_index :categories, :ancestry
  end

end
