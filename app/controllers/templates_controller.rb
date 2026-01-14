class TemplatesController < ApplicationController
  skip_before_action :require_login

  def emoji_template
    @templates = []
  end
  def kansai_template
    @templates = []
  end



  def translation_addition
    @translations = current_user.translations.order(id: :desc).page(params[:page]).per(10)
    if params[:q].present?  # 検索履歴
      @translations = @translations.where("output_text LIKE ?", "%#{params[:q]}%")
    end
  end
  def translation_delete
    # 表示用（GET）
    @histories = current_user.histories.order(id: :desc).page(params[:page]).per(10)
  end



  def add_history
    used_outputs = current_user.histories.pluck(:record)
    @translations = current_user.translations.where.not(output_text: used_outputs).order(id: :desc).page(params[:page]).per(10)

    outputs = (params[:output_texts] || []).map { |t| t.to_s.strip }.reject(&:blank?).uniq

    if outputs.any?
      ActiveRecord::Base.transaction do
        # ① Myテンプレへ追加
        outputs.each do |text|
          current_user.histories.find_or_create_by!(record: text)
        end

        # ② ここで translations から削除（まとめて）
        current_user.translations.where(output_text: outputs).destroy_all
      end

      redirect_to main_edit_history_path, success: "Myテンプレートへ項目を追加しました"
    else
      redirect_to add_history_templates_path, danger: "チェックを入れてください"
    end
  end
  def delete_history
    # 表示用（GET）: translation履歴を一覧表示
    scope = current_user.translations.order(id: :desc)

    # 検索（q があるときだけ絞り込み）
    if params[:q].present?
      q = params[:q].to_s.strip
      scope = scope.where("output_text LIKE ?", "%#{ActiveRecord::Base.sanitize_sql_like(q)}%")
    end
    @translations = scope.page(params[:page]).per(10)
  end

  def translation_delete_execute
    records = (params[:records] || []).map { |t| t.to_s.strip }.reject(&:blank?).uniq

  if records.empty?
    redirect_to delete_history_templates_path, danger: "削除する項目を選択してください"
    return
  end

  ActiveRecord::Base.transaction do
    # history(record) → translation(output_text) に戻す
    records.each do |text|
      current_user.translations.find_or_create_by!(output_text: text)
    end

    # Myテンプレート（histories）から削除
    current_user.histories.where(record: records).destroy_all
  end

  redirect_to translation_delete_templates_path, success: "Myテンプレートから削除しました"
  end


  def delete_history_execute
    records = Array(params[:records]).map { |t| t.to_s.strip }.reject(&:blank?).uniq

    if records.empty?
      redirect_to delete_history_templates_path, danger: "削除する項目を選択してください"
      return
    end

    # ✅ 完全削除：translations から消すだけ（historiesへ戻す等はしない）
    current_user.translations.where(output_text: records).destroy_all

    redirect_to delete_history_templates_path, success: "履歴を完全削除しました"
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
    [ tone, category ]
  end

  def invalid_select?(value)
    value.blank? || value == "選択してください"
  end
end
