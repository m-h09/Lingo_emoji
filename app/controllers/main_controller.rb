class MainController < ApplicationController
  skip_before_action :require_login
  def index
    if logged_in?
      # ログイン後のメインページ表示
      @user = current_user
    else
      # ログイン前のメインページ表示
    end
  end

  def templates
    @templates = MessageTemplate.where(
      emoji: params[:emoji],
      tone: params[:tone],
      category: params[:category]
    ).limit(10)

    # JSリクエストなら部分テンプレートだけ返す
    respond_to do |format|
      format.html { render partial: "templates/list", locals: { templates: @templates } }
      format.any { render plain: "unsupported format", status: 406 }
    end
  end

  def guide; end

  def history
    if params[:q].present? # 検索ワードを発見
      @histories = current_user.histories.where("record LIKE ?", "%#{params[:q]}%").order(created_at: :desc)
    else
      @histories = current_user.histories.order(created_at: :desc)
    end
  end

  def save_history
    current_user.histories.create!(record: params[:record])
    render json: { message: "履歴を保存しました" } #jsonでレスポンスを返す
  end

  def edit_history; end

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
    respond_to do |format|
      format.html { render :index }
    end

  rescue Timeout::Error
    @api_error = "OpenAIの処理がタイムアウトしました。時間をおいて再度お試しください。"
    respond_to do |format|
      format.html { render :index }
    end
  rescue StandardError => e
    @global_error = "予期しないエラーが発生しました。#{e.message}"
    respond_to do |format|
      format.html { render :index }
    end
  end
end
