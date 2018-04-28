class Notice < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :city
  has_many :votes


  def get_rating
    self.votes.count
  end

  def vote_positive(current_user)
    Vote.create(user_id:current_user.id,notice_id:self.id)
  end

  def vote_negative(current_user)
    Vote.find_by(user_id:current_user.id).try(:destroy)
  end

end
