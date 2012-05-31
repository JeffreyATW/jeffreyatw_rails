class CreateEntries < ActiveRecord::Migration
  def change
    unless Entry.table_exists?
      create_table :portfolio_entry, :force => false do |t|
        t.string :name
        t.string :url
        t.text :description
        t.integer :section_id

        t.timestamps
      end
    end
  end
end