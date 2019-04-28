class UserMailer < ActionMailer::Base
  default from: 'NEF Scanning App <no-reply@sheffield.ac.uk>'

  def welcome_email(user)
    @user = user
    @url = "team31.demo4.hut.shefcompsci.org.uk"
    mail(to: @user.email, subject: 'Welcome to NEF Scanning App')
  end
end
