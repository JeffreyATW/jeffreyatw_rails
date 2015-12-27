class FreakmapLocation < ActiveRecord::Base
  geocoded_by :full_address

  def full_address
    "#{name}, #{city}, #{state}"
  end
end
