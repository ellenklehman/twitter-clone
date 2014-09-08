class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email

  has_many :followings
  has_many :followeds, :through => :followings
  has_many :inverse_followings, :class_name => "Following", :foreign_key => "followed_id"
  has_many :inverse_followeds, :through => :inverse_followings, :source => :user, :foreign_key => "user_email"

  has_many :tweets
  after_create :send_signup_email

  def send_signup_email
    UserMailer.signup_confirmation(self).deliver
  end
end
