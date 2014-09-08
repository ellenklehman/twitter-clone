class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, :class_name => "User"

  after_create :email_confirmation

  def email_confirmation
    @user = User.find(self.user_id)
    @followed = User.find(self.followed_id)
    UserMailer.following_confirmation(@followed, @user).deliver
  end
end
