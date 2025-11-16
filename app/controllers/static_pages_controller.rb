class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[faq terms privacy]
  def faq; end

  def terms; end

  def privacy; end
end
