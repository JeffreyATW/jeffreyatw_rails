class Entry < ActiveRecord::Base
  self.table_name = "portfolio_entry"

  attr_accessible :name, :description, :url, :entry_owner_id, :entry_owner_type, :pub_date, :image, :mp4, :webm, :visible

  default_scope :order => ["pub_date desc"]
  scope :visible, :conditions => ["visible = 1"]

  belongs_to :entry_owner, :polymorphic => true

  has_attached_file :image, :styles => {:normal => "250x200>"}, :default_style => :normal
  has_attached_file :mp4
  has_attached_file :webm
end
