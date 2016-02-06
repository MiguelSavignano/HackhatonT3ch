class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         after_initialize :set_default_data, :if => :new_record?


  private
  def set_default_data
     unless self.role
         self.role ||= 'user'
     end
  end
end
