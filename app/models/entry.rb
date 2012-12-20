class Entry < ActiveRecord::Base
  self.table_name = "portfolio_entry"

  attr_accessible :name, :description, :url, :section_id, :pub_date, :image, :thumb1, :thumb2, :thumb3, :visible

  default_scope :order => ["pub_date desc"]
  scope :visible, :conditions => ["visible = 1"]

  belongs_to :section

  has_attached_file :image, :styles => {:normal => "250x200>"}, :default_style => :normal
  has_attached_file :thumb1, :styles => {:normal => "100x100>"}, :default_style => :normal
  has_attached_file :thumb2, :styles => {:normal => "100x100>"}, :default_style => :normal
  has_attached_file :thumb3, :styles => {:normal => "100x100>"}, :default_style => :normal
end
