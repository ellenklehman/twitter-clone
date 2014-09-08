class UserMailer < ActionMailer::Base
  default from: "epicodus@twitter.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def following_confirmation(followed, follower)
    @follower = follower
    @followed = followed
    mail to: followed.email, subject: "You are being followed..."
  end

end
