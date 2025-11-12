class ApplicationMailer < ActionMailer::Base
  default from: "EMOJI関西弁変換 <music8.d0fss2@gmail.com>",
          reply_to: "no-reply@sendgrid.net"
  layout "mailer"
end
