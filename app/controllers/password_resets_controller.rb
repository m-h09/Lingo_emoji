class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])

    @user&.deliver_reset_password_instructions!

    redirect_to login_path, success: "パスワードリセットの案内を送信しました。メールをご確認ください。"
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      redirect_to root_path, alert: "無効なトークンです。"
      save_return_to_url
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      flash[:success] = "パスワードを変更できました"
      redirect_to login_path, status: :see_other
    else
      flash.now[:alert] = "パスワード変更出来ませんでした"
      render :edit, status: :unprocessable_entity
    end
  end
end
