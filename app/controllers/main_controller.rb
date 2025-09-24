class MainController < ApplicationController
  def index; end

  def templates
    @templates = MessageTemplate.where(
      emoji: params[:emoji],
      tone: params[:tone],
      category: params[:category]
    ).limit(10)

    # JSリクエストなら部分テンプレートだけ返す
    respond_to do |format|
      format.html { render partial: "templates/list", locals: { templates: @templates } }
    end
  end

  def create
    base_prompt = params[:base_prompt]

    if base_prompt.blank?
      @input_error = "入力してから「変換」ボタンを押してください"
      render :index and return
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
    render :index
  rescue Timeout::Error
    @api_error = "OpenAIの処理がタイムアウトしました。時間をおいて再度お試しください。"
    render :index
  rescue StandardError => e
    @global_error = "予期しないエラーが発生しました。#{e.message}"
    render :index
  end
end
