class AddAttachmentAndRemoveImageFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :image
    add_attachment :users, :image
  end
end
