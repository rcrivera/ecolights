class AddAttachmentPictureToApprovals < ActiveRecord::Migration
  def self.up
    change_table :approvals do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :approvals, :picture
  end
end
