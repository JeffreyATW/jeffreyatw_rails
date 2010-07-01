class AddAttachmentImageToEntries < ActiveRecord::Migration
  def self.up
    add_column :portfolio_entry, :image_file_name, :string
    add_column :portfolio_entry, :image_content_type, :string
    add_column :portfolio_entry, :image_file_size, :integer
    add_column :portfolio_entry, :image_updated_at, :datetime

    Entry.update_all 'image_file_name = image'

    remove_column :portfolio_entry, :image
  end

  def self.down
    add_column :portfolio_entry, :image, :string

    Entry.update_all 'image = image_file_name'

    remove_column :portfolio_entry, :image_file_name
    remove_column :portfolio_entry, :image_content_type
    remove_column :portfolio_entry, :image_file_size
    remove_column :portfolio_entry, :image_updated_at
  end
end