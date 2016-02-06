class Notice < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  def latitude
    39.9125
  end
  def longitude
    -4.6862948
  end
end
