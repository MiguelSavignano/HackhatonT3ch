class Notice < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :city
  has_many :votes


  def get_rating
    self.votes.count
  end

end
