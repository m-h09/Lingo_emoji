class MainController < ApplicationController
  skip_before_action :require_login
  def index
    if logged_in?
      # ログイン後のメインページ表示
      @user = current_user
      @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(20)
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
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(20)
  end

  def add_history
    outputs = params[:output_texts] || []

    if outputs.any?
      outputs.each do |text|
        current_user.histories.find_or_create_by!(record: text)
      end
      redirect_to main_history_path, success: "登録しました"
    else
      redirect_to main_edit_history_path, danger: "チェックを入れてください"
    end
  end
  def delete_history
    if params[:records].present?
      deleted_records = params[:records] # 画面上でチェックされたrecord
      deleted_records.each do |text|
        unless current_user.translations.exists?(output_text: text)
        current_user.translations.create!(output_text: text)
        end
    end
      # historyから削除
      current_user.histories.where(record: deleted_records).destroy_all
      redirect_to main_edit_history_path, success: "選択した履歴を削除しました"
    else
      redirect_to main_edit_history_path, danger: "削除する履歴を選択してください"
    end
  end


  def edit_history
    # すでに履歴に登録された output_text を除外
    used_outputs = current_user.histories.pluck(:record)

    @translations = current_user.translations
    @translations = @translations.where.not(output_text: used_outputs).order(id: :desc).page(params[:translation_page]).per(20)
    # 登録削除よう
    @histories = current_user.histories.order(created_at: :desc).page(params[:history_page]).per(20)

    if params[:q].present?  # 検索履歴
      @translations = @translations.where("output_text LIKE ?", "%#{params[:q]}%")
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

    if logged_in? && @output.present?
      current_user.translations.create!(output_text: @output)
    end
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
