class AddAttachmentThumb3ToEntries < ActiveRecord::Migration
  def self.up
    add_column :portfolio_entry, :thumb3_file_name, :string
    add_column :portfolio_entry, :thumb3_content_type, :string
    add_column :portfolio_entry, :thumb3_file_size, :integer
    add_column :portfolio_entry, :thumb3_updated_at, :datetime

    Entry.update_all 'thumb3_file_name = thumb3'

    remove_column :portfolio_entry, :thumb3
  end

  def self.down
    remove_column :portfolio_entry, :thumb3_file_name
    remove_column :portfolio_entry, :thumb3_content_type
    remove_column :portfolio_entry, :thumb3_file_size
    remove_column :portfolio_entry, :thumb3_updated_at
  end
end
