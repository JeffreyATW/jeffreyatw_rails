class AddDescriptionToSections < ActiveRecord::Migration
  def change
    add_column :portfolio_section, :description, :text
  end
end
