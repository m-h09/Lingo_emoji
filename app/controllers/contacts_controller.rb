# app/controllers/contacts_controller.rb
class ContactsController < ApplicationController
  skip_before_action :require_login

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.deliver
      redirect_to contact_path, success: "送信が完了しました！"
    else
      flash.now[:danger] = "送信に失敗しました。入力内容を確認してください。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
