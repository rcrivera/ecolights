class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :sku_code
      t.text :specifications
      t.text :features

      t.timestamps
    end
  end
end
