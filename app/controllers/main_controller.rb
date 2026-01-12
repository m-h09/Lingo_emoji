class MainController < ApplicationController
  skip_before_action :require_login
  def index
    if logged_in?
      # ログイン後のメインページ表示
      @user = current_user
      @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10)
    else
      # ログイン前のメインページ表示
    end
  end



  def guide; end

  def history
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10)
  end

  # def add_history
  #   outputs = params[:output_texts] || []

  #   if outputs.any?
  #     outputs.each do |text|
  #       current_user.histories.find_or_create_by!(record: text)
  #     end
  #     redirect_to main_index_path, success: "Myテンプレートへ項目を追加しました"
  #   else
  #     redirect_to main_edit_history_path, danger: "チェックを入れてください"
  #   end
  # end
  # def delete_history
  #   if params[:records].present?
  #     deleted_records = params[:records] # 画面上でチェックされたrecord
  #     deleted_records.each do |text|
  #       unless current_user.translations.exists?(output_text: text)
  #       current_user.translations.create!(output_text: text)
  #       end
  #   end
  #     # historyから削除
  #     current_user.histories.where(record: deleted_records).destroy_all
  #     redirect_to main_edit_history_path, success: "選択した履歴を削除しました"
  #   else
  #     redirect_to main_edit_history_path, danger: "削除する履歴を選択してください"
  #   end
  # end

  # def translation_delete
  #   if params[:records].present?
  #     deleted_records = params[:records] # 画面上でチェックされたrecord
  #     current_user.translations.where(output_text: deleted_records).destroy_all
  #     redirect_to main_edit_history_path, success: "選択した項目を削除しました"
  #   else
  #     redirect_to main_edit_history_path, danger: "削除する項目を選択してください"
  #   end
  # end


  def edit_history
    # すでに履歴に登録された output_text を除外
    # used_outputs = current_user.histories.pluck(:record)

    # @translations = current_user.translations.where.not(output_text: used_outputs).order(id: :desc).page(params[:page]).per(10)
    # # 登録削除よう
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @input_text = nil
    base_prompt = params[:base_prompt]

    if base_prompt.blank?
      @input_error = "入力してから「変換」ボタンを押してください"
      @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
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


    if logged_in?
      @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10)
    end

    respond_to do |format|
      format.html { render :index }
    end

  rescue Timeout::Error
    @api_error = "OpenAIの処理がタイムアウトしました。時間をおいて再度お試しください。"
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
    render :index

  rescue StandardError => e
    @global_error = "予期しないエラーが発生しました。#{e.message}"
    @histories = current_user.histories.order(created_at: :desc).page(params[:page]).per(10) if logged_in?
    render :index
  end
end
