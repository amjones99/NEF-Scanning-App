class UserMailer < ActionMailer::Base
  default from: 'NEF Scanning App <no-reply@sheffield.ac.uk>'

  def new_stock_email(users, product, url)
    @product = product
    @url = team31.demo4.hut.shefcompsci.org.uk
    mail(to: @user.email, bcc: users, subject: 'Welcome to NEF Scanning App')
  end
end
