class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  default_scope :order => ["id"]
  scope :visible, :conditions => ["visible = 1"]

  has_many :entries

  attr_accessible :name
end