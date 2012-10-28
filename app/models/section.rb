class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  has_many :entries

  attr_accessible :name
end
