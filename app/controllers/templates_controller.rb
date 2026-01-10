class TemplatesController < ApplicationController
  skip_before_action :require_login

  def emoji_template
    @templates = []
  end

  def list
    tone, category = fetch_tone_category
    emoji = params[:emoji] || params.dig(:message_template, :emoji) # hiddenなどから拾う

    templates =
      if invalid_select?(tone) || invalid_select?(category) || invalid_select?(emoji)
        MessageTemplate.none
      else
        MessageTemplate.where(emoji: emoji, tone: tone, category: category)
      end

    @templates = templates.order(id: :desc).page(params[:page]).per(10)

    render partial: "templates/list", locals: { templates: @templates }, layout: false
  end

  private

  def fetch_tone_category
    tone     = params[:tone]     || params.dig(:message_template, :tone)
    category = params[:category] || params.dig(:message_template, :category)
    [tone, category]
  end

  def invalid_select?(value)
    value.blank? || value == "選択してください"
  end
end
