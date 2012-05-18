class Entry < ActiveRecord::Base
  has_attached_file :image, :styles => {:normal => "250x200>"}, :default_style => :normal
  has_attached_file :thumb1, :styles => {:normal => "100x100>"}, :default_style => :normal
  has_attached_file :thumb2, :styles => {:normal => "100x100>"}, :default_style => :normal
  has_attached_file :thumb3, :styles => {:normal => "100x100>"}, :default_style => :normal
end
