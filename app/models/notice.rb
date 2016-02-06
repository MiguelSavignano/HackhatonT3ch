class Notice < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :votes

  def latitude
    39.9125
  end

  def longitude
    -4.6862948
  end

  def get_rating
    self.votes.count
  end
  
end
