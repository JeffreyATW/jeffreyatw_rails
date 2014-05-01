class Subsection < ActiveRecord::Base
  default_scope { order('position') }

  scope :visible, -> { where(visible: true) }

  has_many :entries, :as => :entry_owner
  belongs_to :section

  acts_as_list
end