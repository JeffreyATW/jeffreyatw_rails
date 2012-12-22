class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.string :name
      t.references :section
      t.boolean :visible
      t.integer :position
    end
  end
end