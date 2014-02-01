class AddAttachmentPdfToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :downloads, :pdf
  end
end
