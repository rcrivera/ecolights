class CreateTechnologyProducts < ActiveRecord::Migration
  def change
    create_table :technology_products do |t|
      t.integer :technology_id
      t.integer :product_id

      t.timestamps
    end
  end
end
