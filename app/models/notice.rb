class Notice < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :city
  has_many :votes, dependent: :destroy

  def rating
    votes.count
  end

  def vote_positive(current_user)
    Vote.create(user_id: current_user.id, notice_id: id)
  end

  def vote_negative(current_user)
    Vote.find_by(user_id: current_user.id).try(:destroy)
  end
end
