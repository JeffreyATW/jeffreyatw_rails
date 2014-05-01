class Section < ActiveRecord::Base
  self.table_name = "portfolio_section"

  default_scope { order('id') }
  scope :visible, -> { where(visible: true) }

  has_many :entries, :as => :entry_owner
  has_many :subsections

  has_attached_file :image
  has_attached_file :mp4
  has_attached_file :webm
end