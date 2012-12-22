class Section < ActiveRecord::Base
  attr_accessible :name, :visible, :entries

  self.table_name = "portfolio_section"

  default_scope :order => ["id"]
  scope :visible, :conditions => ["visible = 1"]

  has_many :entries, :as => :entry_owner
  has_many :subsections

  attr_accessible :name
end