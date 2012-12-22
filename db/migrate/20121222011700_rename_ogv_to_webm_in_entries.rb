class RenameOgvToWebmInEntries < ActiveRecord::Migration
  def change
    rename_column :portfolio_entry, :ogv_file_name, :webm_file_name
    rename_column :portfolio_entry, :ogv_content_type, :webm_content_type
    rename_column :portfolio_entry, :ogv_file_size, :webm_file_size
    rename_column :portfolio_entry, :ogv_updated_at, :webm_updated_at
  end
end
