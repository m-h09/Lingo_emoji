class UserMailer < ApplicationMailer
  default from: ENV["MAIL_SENDER_ADDRESS"]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "パスワードリセット"
      # from は削除！
    )
  end
end
