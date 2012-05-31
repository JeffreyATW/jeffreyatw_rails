class CreateSections < ActiveRecord::Migration
  def change
    unless Section.table_exists?
      create_table :portfolio_section, :force => false do |t|
        t.string :name

        t.timestamps
      end
    end
  end
end