class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_SENDER_ADDRESS"] 
  layout "mailer"
end
