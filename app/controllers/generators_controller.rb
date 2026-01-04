class GeneratorsController < ApplicationController
  skip_before_action :require_login
  def auto_emoji; end
  def auto_kansai; end
  def auto_both; end

  def create
    @input_text = nil
    base_prompt = params[:base_prompt]

    view =
      case params[:emoji]
      when "add"          then :auto_emoji
      when "kansai"       then :auto_kansai
      when "emoji_kansai" then :auto_both
      else :auto_emoji
      end

      errors = []

      base_prompt = params[:base_prompt]
      tone        = params[:tone]
      strength    = params[:strength]


      errors << "入力してから「変換」ボタンを押してください" if base_prompt.blank?
      errors << "トーンを選択してください" if tone.blank? || tone == "選択してください"
      if params[:emoji] != "kansai"
        errors << "emojiの多さを選択してください" if strength.blank? || strength == "選択してください"
      end


      if errors.any?
        @input_errors = errors
        @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
        render view, status: :unprocessable_entity and return
      end

    service = EmojiConverterService.new(
      base_prompt: base_prompt,
      style: params[:style],
      tone: params[:tone],
      emoji: params[:emoji],
      radio_emoji: params[:radio_emoji],
      strength: params[:strength]
    )

    @input_text = base_prompt
    @output = service.call

    if logged_in? && @output.present?
      current_user.translations.create!(output_text: @output)
    end

    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?

    respond_to do |format|
      format.html { render view, anchor: "result" }
    end

  rescue Timeout::Error
    @api_error = "OpenAIの処理がタイムアウトしました。時間をおいて再度お試しください。"
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
    render view, status: :unprocessable_entity, anchor: "result"

  rescue StandardError => e
    @global_error = "予期しないエラーが発生しました。#{e.message}"
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
    render view, status: :unprocessable_entity, anchor: "result"
  end
end
