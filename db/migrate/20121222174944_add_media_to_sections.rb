class AddMediaToSections < ActiveRecord::Migration
  def change
    add_column :portfolio_section, :image_file_name, :string
    add_column :portfolio_section, :image_content_type, :string
    add_column :portfolio_section, :image_file_size, :integer
    add_column :portfolio_section, :image_updated_at, :datetime
    add_column :portfolio_section, :mp4_file_name, :string
    add_column :portfolio_section, :mp4_content_type, :string
    add_column :portfolio_section, :mp4_file_size, :integer
    add_column :portfolio_section, :mp4_updated_at, :datetime
    add_column :portfolio_section, :webm_file_name, :string
    add_column :portfolio_section, :webm_content_type, :string
    add_column :portfolio_section, :webm_file_size, :integer
    add_column :portfolio_section, :webm_updated_at, :datetime
  end
end
