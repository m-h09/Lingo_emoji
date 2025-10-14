class ApplicationController < ActionController::Base
  before_action :require_login
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  include MetaTags::ControllerHelper
  allow_browser versions: :modern
  add_flash_types :success, :danger

  private

  def not_authenticated
    redirect_to login_path, alert: "ログインが必要です"
  end
end
