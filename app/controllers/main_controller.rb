class MainController < ApplicationController
  def index; end

  def create
    base_prompt = params[:base_prompt]

    if base_prompt.blank?
      @input_error = "入力してから「変換」ボタンを押してください"
      @output = nil
      render :index

    else
      style = params[:style]
      tone = params[:tone]
      emoji = params[:emoji]
      radio_emoji = params[:radio_emoji]
      strength = params[:strength]

      Rails.logger.debug "選択されたemojiタイプ: #{emoji}"

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
        tone_rule = "丁寧でかしこまった表現にしてください。派手な絵文字は使わないでください。関西弁の場合は『〜してはりますか』『〜されはるんですか？』など、実際に使われる丁寧な関西弁にしてください。不自然な言い回しは避けてください。"
      when "casual"
        tone_rule = "カジュアルで親しみやすい表現にしてください。絵文字は楽しくバランスよく使ってください。関西弁の場合は『〜してるん？』『〜やねん』など、日常会話でよく使う自然な言い方にしてください。"
      when "frank"
        tone_rule = "砕けた率直な表現にしてください。絵文字は自由にたくさん使って構いませんがstrengthに合わせていい塩梅にしてください。関西弁の場合は『〜やろ』『〜ちゃう？』など自然な雑談風にしてください。実際に日常会話で使わない不自然な表現（例:『ありがとさんな』など）は使わないでください。"
      else
        tone_rule = ""
      end

      case strength
      when "weak"
        strength_rule = <<~RULE
        絵文字は1文に1つ程度にしてください。
        関西弁の場合は柔らかい表現を使ってください。不自然な関西弁（例:『ありがとさんな』『ありがとやで』など）は使わないでください。
        例:
        - 「突き当たり」は「どんつき」、白々しい→しらこい、バカ→アホ、行く途中→行きしな・行きし、帰る途中→帰りしな・帰りし
        - 同じ→おんなし・おなし、動く→いごく、疲れた→しんどい、捨てる→ほかす、違う→ちゃう、辛い、えらい
        - しない→せぇへん・しぃひん、いない→おらん
        - まぁまぁ・そろそろ→ぼちぼち、じゃあね→ほなね、またね→ほなまた

      RULE
      when "medium"
        strength_rule = <<~RULE
        絵文字は1文に2つ程度, もしくはひと単語に１つにしてください。
        関西弁の場合は自然で日常的な表現にしてください。
        例:
        - 「突き当たり」は「どんつき」、白々しい→しらこい、バカ→アホ、行く途中→行きしな・行きし、帰る途中→帰りしな・帰りし
        - 同じ→おんなし・おなし、動く→いごく、疲れた→しんどい、捨てる→ほかす、違う→ちゃう、辛い、えらい
        - 「ありがとう」は「ありがとうな」「助かるわ」と言い換える
        - しない→せぇへん・しぃひん、いない→おらん
        - まぁまぁ→ぼちぼち、じゃあね→ほなね、またね→ほなまた
        - 不自然な古い言葉や使われない表現は使わない
      RULE
      when "strong"
        strength_rule = <<~RULE
        絵文字は1文に3つ以上、または単語ごとに複数入れてください。
        関西弁の場合はコテコテで特徴的な表現にしてください。
        例:
        - 「突き当たり」は「どんつき」、白々しい→しらこい、バカ→アホ、行く途中→行きしな・行きし、帰る途中→帰りしな・帰りし
        - 同じ→おんなし・おなし、動く→いごく、疲れた→しんどい,捨てる→ほかす、違う→ちゃう、辛い、えらい
        - ない→あらへん、怒る→いらう・かなん、できない→でけへん
        - まぁまぁ→ぼちぼち、じゃあね→ほなね、またね→ほなまた
        - 吉本新喜劇などでつかわれるような表現を使う
        - 「ありがとう」は「おおきにな」、お願い→頼むわ
      RULE
      else
        strength_rule = ""
      end

      case emoji
      when "add"
        prompt = <<~PROMPT
          次のテキストに絵文字を追加してください：
          「#{base_prompt}」

          条件:
          - 絵文字は文脈に合ったものだけを使ってください。日常会話に関係ないもの（📦や🚀など突拍子もないもの）は使わないでください。
          - 人や感情・動作に関連する絵文字（😊😂😢👍🙏🙌など）を優先してください。
          - 文章の内容は変更しない
          - 絵文字の選び方にトーン「#{tone_rule}」を反映する
          - 翻訳はしないでください。入力文をそのまま使い、絵文字だけを追加してください。
          - 日本語の表現（言葉遣い）は変更しないでください。
          - #{emoji_rule}
          - #{strength_rule}
        PROMPT
      when "kansai"
        prompt = <<~PROMPT
          次のテキストを関西弁に翻訳してください（翻訳のみ、説明なし）：
          「#{base_prompt}」

          条件:
          - 翻訳結果だけを返してください
          - 入力分以外の文章や説明は絶対に追加しないでください

          - トーン: #{tone_rule}
          - 絵文字は使わない
          - #{strength_rule}
        PROMPT
      when "emoji_kansai"
        prompt = <<~PROMPT
        あなたは翻訳ツールです。
        以下のテキストを「関西弁＋絵文字付き」に変換してください。
        出力は翻訳結果のみで、説明や条件文は絶対に出さないこと。

        入力: 「#{base_prompt}」

        出力条件:
        - 入力文を必ず翻訳する（短文や単語だけでも翻訳する）
        - 入力文以外の文章は追加しない
        - 翻訳結果だけを返す
        - トーン: #{tone_rule}（関西弁と絵文字で表現）
        - #{emoji_rule}
        - #{strength_rule}

        出力:
      PROMPT
      else
        @output_error = "変換タイプが選択されていません"
        render :index and return
      end

      begin
        result = OpenaiService.generate_text(prompt)
        # 文頭と文末にある「」を削除
        # 文頭・文末にある「や」などの余計な括弧を削除
        result = result.gsub(/\A[「]+|[」]+$/, "")
        result = result.gsub(/[「」]/, "")
        @input_text = base_prompt
        @output = result
      rescue Timeout::Error
        @api_error = "OpenAIの処理がタイムアウトしました。時間をおいて再度お試しください。"
        @output = nil
      rescue StandardError => e
        case e.message
        when /401/
          @api_error = "APIキーが無効です。 管理者にお問い合わせください。"
        when /429/
          @global_error = "リクエストが多すぎます。時間をおいて再度お試しください。"
        else
          @global_error = "予期しないエラーが発生しました。#{e.message}"
        end
        @output = nil
      end
      render :index
    end
  end
end
