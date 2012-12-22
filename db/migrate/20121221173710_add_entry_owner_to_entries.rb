class AddEntryOwnerToEntries < ActiveRecord::Migration
  def change
    rename_column :portfolio_entry, :section_id, :entry_owner_id
    add_column :portfolio_entry, :entry_owner_type, :string, :default => "Section"
  end
end
