class MainController < ApplicationController
  def index; end

  def create
    base_prompt = params[:base_prompt]

      style = params[:style]
      tone = params[:tone]
      emoji = params[:emoji]
      radio_emoji = params[:radio_emoji]

      case emoji
      when "add_emoji"
        prompt = <<~PROMPT
          次のテキストに絵文字を追加してください：
          「#{base_prompt}」

          条件:
          - 文章の内容は変更しない
          - 絵文字の選び方にスタイル「#{style}」とトーン「#{tone}」を反映する
          - 絵文字の種類: #{radio_emoji}
        PROMPT
      when "kansai"
        prompt = <<~PROMPT
          次のテキストを関西弁に翻訳してください：
          「#{base_prompt}」

          条件:
          - スタイル: #{style}
          - トーン: #{tone}
          - 絵文字は使わない
        PROMPT
      when "emoji_kansai"
        prompt = <<~PROMPT
          次のテキストを関西弁に翻訳し、絵文字を追加してください：

          条件:
          - スタイル: #{style}
          - トーン: #{tone}（関西弁と絵文字で表現）
          - 絵文字の種類: #{radio_emoji}
        PROMPT
      else
        prompt = "変換タイプが選択されていません"
      end
      result = OpenaiService.generate_text(prompt)

      @input_text = base_prompt
      @output_text = result

      render :index
  end
end
