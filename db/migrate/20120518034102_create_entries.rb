class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :section_id

      t.timestamps
    end
  end
end
