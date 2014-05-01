class Entry < ActiveRecord::Base
  self.table_name = "portfolio_entry"

  default_scope { order('pub_date desc') }
  scope :visible, -> { where(visible: true) }

  belongs_to :entry_owner, :polymorphic => true

  has_attached_file :image
  has_attached_file :mp4
  has_attached_file :webm
end
