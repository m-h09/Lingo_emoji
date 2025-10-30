class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mail, :from)
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(@user.reset_password_token, host: Settings.mailer.host)
    mail(to: @user.email, subject: "パスワードリセット", from: Settings.mailer.default_from)
  end
end
