class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :attributes_titles, :string
  end
end
