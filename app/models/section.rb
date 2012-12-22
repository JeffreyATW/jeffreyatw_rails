class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  attr_accessible :name, :description, :visible, :entries, :subsections, :image, :mp4, :webm

  default_scope :order => ["id"]
  scope :visible, :conditions => ["visible = 1"]

  has_many :entries, :as => :entry_owner
  has_many :subsections

  has_attached_file :image
  has_attached_file :mp4
  has_attached_file :webm
end