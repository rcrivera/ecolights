class AddAttachmentPictureToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :categories, :picture
  end
end
