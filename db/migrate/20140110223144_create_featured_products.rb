class CreateFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :featured_products do |t|
      t.integer :product_id
      t.string :message
      t.integer :position

      t.timestamps
    end
  end
end
