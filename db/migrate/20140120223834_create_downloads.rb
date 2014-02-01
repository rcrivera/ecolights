class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :product_id
      t.string :title

      t.timestamps
    end
  end
end
