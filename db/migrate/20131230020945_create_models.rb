class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :product_id
      t.string :sku_code
      t.text :characteristics

      t.timestamps
    end
  end
end
