class CreateFreakmapLocations < ActiveRecord::Migration
  def change
    create_table :freakmap_locations do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :machines
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
