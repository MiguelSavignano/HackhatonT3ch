class User < ActiveRecord::Base
  has_merit

  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :city
  has_many :notices
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         after_initialize :set_default_data, :if => :new_record?


  private
  def set_default_data
     unless self.role
         self.role ||= 'user'
     end
  end

  def has_voted?(notice_id)
    self.votes.any? do |vote|
      vote[:notice_id] == notice_id
    end
  end

  def times_voted
    self.votes.count
  end

end
