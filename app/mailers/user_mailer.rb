class UserMailer < ApplicationMailer
  default from: ENV["MAIL_SENDER_ADDRESS"]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(@user.reset_password_token, host: "https://lingo-emoji.onrender.com")
    mail(
      to: @user.email,
      subject: "パスワードリセット",
      from: "EMOJI関西弁変換 <music8.d0fss2@gmail.com>",
      reply_to: "no-reply@sendgrid.net"
    )
  end
end
