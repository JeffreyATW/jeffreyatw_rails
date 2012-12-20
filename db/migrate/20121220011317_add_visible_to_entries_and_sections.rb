class AddVisibleToEntriesAndSections < ActiveRecord::Migration
  def change
    add_column :portfolio_entry, :visible, :boolean, :default => 1
    add_column :portfolio_section, :visible, :boolean, :default => 1
  end
end
