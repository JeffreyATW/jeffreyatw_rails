class Subsection < ActiveRecord::Base
  attr_accessible :name, :position, :visible, :section_id, :entries

  default_scope :order => ["position"]

  scope :visible, :conditions => ["visible = 1"]

  has_many :entries, :as => :entry_owner
  belongs_to :section

  acts_as_list
end