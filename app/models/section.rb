class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  default_scope :order => ["id"]

  has_many :entries

  attr_accessible :name
end
