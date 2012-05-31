class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  attr_accessible :name
end
