class Notice < ActiveRecord::Base
  belongs_to :city
  has_many :votes
end
