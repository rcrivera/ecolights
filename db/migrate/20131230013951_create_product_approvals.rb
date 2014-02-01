class CreateProductApprovals < ActiveRecord::Migration
  def change
    create_table :product_approvals do |t|
      t.integer :product_id
      t.integer :approval_id

      t.timestamps
    end
  end
end
