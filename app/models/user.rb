class User < ApplicationRecord
  has_merit

  has_many :votes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :city
  has_many :notices, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  after_initialize :set_default_data, if: :new_record?

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      # binding.pry
      user.email = if auth.provider == "twitter"
                     auth.info.nickname + "@twitter.com"
                   else
                     auth.info.email
                   end
      # binding.pry
      user.avatar = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.find_for_twitter_oauth(auth, _signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    if user
      user
    else
      registered_user = User.where(email: auth.uid + "@twitter.com").first
      if registered_user
        registered_user
      else
        User.create(name: auth.extra.raw_info.name,
                    provider: auth.provider,
                    uid: auth.uid,
                    email: auth.uid + "@twitter.com",
                    password: Devise.friendly_token[0, 20])
      end
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).find_by(["username = :value OR lower(email) = lower(:value)", { value: login }])
    else
      fing_by(conditions)
    end
  end

  private

  def set_default_data
    self.role ||= 'user' unless role
  end

  def voted?(notice_id)
    votes.any? do |vote|
      vote[:notice_id] == notice_id
    end
  end

  def times_voted
    votes.count
  end
end
