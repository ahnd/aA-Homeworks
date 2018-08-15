class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'
  def welcome_email(user)
    @user = user
    @url = 'http://appacademy.com/login'
    mail(to: user.email, subject: 'Hello!')
  end
end
