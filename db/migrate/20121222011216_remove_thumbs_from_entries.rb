class RemoveThumbsFromEntries < ActiveRecord::Migration
  def change
    remove_column :portfolio_entry, :thumb1_file_name
    remove_column :portfolio_entry, :thumb1_content_type
    remove_column :portfolio_entry, :thumb1_file_size
    remove_column :portfolio_entry, :thumb1_updated_at
    remove_column :portfolio_entry, :thumb2_file_name
    remove_column :portfolio_entry, :thumb2_content_type
    remove_column :portfolio_entry, :thumb2_file_size
    remove_column :portfolio_entry, :thumb2_updated_at
    remove_column :portfolio_entry, :thumb3_file_name
    remove_column :portfolio_entry, :thumb3_content_type
    remove_column :portfolio_entry, :thumb3_file_size
    remove_column :portfolio_entry, :thumb3_updated_at
  end
end
