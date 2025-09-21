class MainController < ApplicationController
  def index; end

  def create
    base_prompt = params[:base_prompt]

    if base_prompt.blank?
      @error_message = "入力してから「変換」ボタンを押してください"
      @output = nil
      render :index

    else
      style = params[:style]
      tone = params[:tone]
      emoji = params[:emoji]
      radio_emoji = params[:radio_emoji]

      case radio_emoji
      when "no_kaomoji"
        emoji_rule ="顔系絵文字（😊😂😢など）は一切使わないでください"
      when "no_icon"
        emoji_rule = "アイコン系絵文字(❤️ 💔 ⭐ 🔥🏠🚗📱など）は一切使わないでください、ただし手のジェスチャー（👌 👍 🙌 🙏など）は使ってよい"
      when "nothing"
        emoji_rule = "絵文字は何でも使ってください"
      else
        emoji_rule = ""
      end

      case tone
      when "formal"
        tone_rule = "丁寧でかしこまった表現にしてください。派手な絵文字は使わないでください。関西弁の場合は関西弁を使った丁寧語で表現してください。「〜してはりますか」「〜されはるんですか？」のように敬語を使ってください。"
      when "casual"
        tone_rule = "カジュアルで親しみやすい表現にしてください。絵文字は楽しくバランスよく使ってください。関西弁の場合は「〜してるん？」「〜やねん」のような口調にしてください。"
      when "frank"
        tone_rule = "砕けた率直な表現にしてください。絵文字は自由にたくさん使って構いません。関西弁の場合は「〜やろ」「〜ちゃう？」のようにラフな言い方にしてください。"
      else
        tone_rule = ""
      end

      case emoji
      when "add_emoji"
        prompt = <<~PROMPT
          次のテキストに絵文字を追加してください：
          「#{base_prompt}」

          条件:
          - 文章の内容は変更しない
          - 絵文字の選び方にトーン「#{tone_rule}」を反映する
          - #{emoji_rule}
        PROMPT
      when "kansai"
        prompt = <<~PROMPT
          次のテキストを関西弁に翻訳してください（翻訳のみ、説明なし）：
          「#{base_prompt}」

          条件:
          - トーン: #{tone_rule}
          - 絵文字は使わない
        PROMPT
      when "emoji_kansai"
        prompt = <<~PROMPT
          次のテキストを関西弁に翻訳し、絵文字を追加してください（翻訳のみ、説明なし）：

          条件:
          - トーン: #{tone_rule}（関西弁と絵文字で表現）
          - #{emoji_rule}
        PROMPT
      else
        prompt = "変換タイプが選択されていません"
      end
      result = OpenaiService.generate_text(prompt)
      # 文頭と文末にある「」を削除
      # 文頭・文末にある「や」などの余計な括弧を削除
      result = result.gsub(/\A[「]+|[」]+$/, '')
      @input_text = base_prompt
      @output = result

      render :index
    end
  end
end
