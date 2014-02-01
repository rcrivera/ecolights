class AddAttachmentPictureToTechnologies < ActiveRecord::Migration
  def self.up
    change_table :technologies do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :technologies, :picture
  end
end
