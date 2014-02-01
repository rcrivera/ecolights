class AddIndexToTable < ActiveRecord::Migration
  def change
    add_index :technologies, :title, :unique => true
  end
end