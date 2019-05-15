#Application_Mailer is a ruby file used that allows you to send emails from your application using mailer classes and views

class ApplicationMailer < ActionMailer::Base
  default from: 'donotreply.contact@nefscanningapp.or.uk'
  layout 'mailer'
end
