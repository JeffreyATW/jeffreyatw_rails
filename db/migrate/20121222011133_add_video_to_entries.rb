class AddVideoToEntries < ActiveRecord::Migration
  def change
    add_column :portfolio_entry, :mp4_file_name, :string
    add_column :portfolio_entry, :mp4_content_type, :string
    add_column :portfolio_entry, :mp4_file_size, :integer
    add_column :portfolio_entry, :mp4_updated_at, :datetime
    add_column :portfolio_entry, :ogv_file_name, :string
    add_column :portfolio_entry, :ogv_content_type, :string
    add_column :portfolio_entry, :ogv_file_size, :integer
    add_column :portfolio_entry, :ogv_updated_at, :datetime
  end
end
