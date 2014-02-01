class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
