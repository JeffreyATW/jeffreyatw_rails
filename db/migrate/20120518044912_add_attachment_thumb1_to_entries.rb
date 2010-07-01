class AddAttachmentThumb1ToEntries < ActiveRecord::Migration
  def self.up
    add_column :portfolio_entry, :thumb1_file_name, :string
    add_column :portfolio_entry, :thumb1_content_type, :string
    add_column :portfolio_entry, :thumb1_file_size, :integer
    add_column :portfolio_entry, :thumb1_updated_at, :datetime
  end

  def self.down
    remove_column :portfolio_entry, :thumb1_file_name
    remove_column :portfolio_entry, :thumb1_content_type
    remove_column :portfolio_entry, :thumb1_file_size
    remove_column :portfolio_entry, :thumb1_updated_at
  end
end
