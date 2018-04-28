class City < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :notices, dependent: :destroy
end
