class CreateEntries < ActiveRecord::Migration
  def change
    unless Entry.table_exists?
      create_table :portfolio_entry, :force => false do |t|
        t.string :name
        t.string :url
        t.text :description
        t.integer :section_id
        t.datetime :pub_date
        t.string :image
        t.string :thumb1
        t.string :thumb2
        t.string :thumb3

        t.timestamps
      end
    end
  end
end