# app/mailers/contact_mailer.rb
class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(
      to: ENV["CONTACT_TO"],
      subject: "【問い合わせ】#{contact.name}様より"
    )
  end
end
