class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :city
  has_many :notices
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
         after_initialize :set_default_data, :if => :new_record?


         def self.from_omniauth(auth)
            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
              user.provider = auth.provider
              user.uid = auth.uid
              #binding.pry
              if auth.provider == "twitter"
                user.email = auth.info.nickname + "@twitter.com"
              else
                user.email = auth.info.email
              end
              #binding.pry
              user.avatar = auth.info.image
              user.password = Devise.friendly_token[0,20]
            end
        end

        def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
          user = User.where(:provider => auth.provider, :uid => auth.uid).first
          if user
            return user
          else
            registered_user = User.where(:email => auth.uid + "@twitter.com").first
            if registered_user
              return registered_user
            else

              user = User.create(name:auth.extra.raw_info.name,
                                  provider:auth.provider,
                                  uid:auth.uid,
                                  email:auth.uid+"@twitter.com",
                                  password:Devise.friendly_token[0,20],
                                )
            end

          end
        end



        def self.find_first_by_auth_conditions(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
          else
            where(conditions).first
          end
        end
  private
  def set_default_data
     unless self.role
         self.role ||= 'user'
     end
  end
end
