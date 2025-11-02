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
    @user = User.load_from_reset_password_token(params[:id])

    if @user && @user.change_password!(params[:user][:password)
      flash[:success] = "パスワードを更新しました。ログインしてください。"
      redirect_to login_path
    else
      flash.now[:alert] = "パスワードの更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end
end
