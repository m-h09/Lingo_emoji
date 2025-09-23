class EmojiConverterService
  FACE_EMOJIS = ["😥","😊","😂","🤣"].freeze
  ICON_EMOJIS = ["📚","🎉","🚗","🍣"].freeze

  def initialize(base_prompt:, style:, tone:, emoji:, radio_emoji:, strength:)
    @base_prompt = base_prompt
    @style = style
    @tone = tone
    @emoji = emoji
    @radio_emoji = radio_emoji
    @strength = strength
  end

  def call
    prompt = build_prompt
    result = OpenaiService.generate_text(prompt)
    clean_text(result)
  end

  private

  # ---------------------------
  # 各選択しごとのルール
  # ---------------------------
  # 口調×絵文字のガイドだけ
  def tone_emoji_rule
    case @tone
    when "formal"
      "絵文字は基本使わない。使う場合も最小限にする。"
    when "casual"
      "絵文字は楽しく、バランスよく使う。"
    when "frank"
      "絵文字は自由に多めでもよい。"
    else
      ""
    end
  end

  # 口調×関西弁のガイドだけ
  def tone_kansai_rule
    case @tone
    when "formal"
      <<~RULE
        【関西弁変換のルール】
        - 丁寧な関西弁（「〜してはりますか」「〜されはるんですか？」など）を使う。
        - 不自然な言い回しは避ける。
      RULE
    when "casual"
      <<~RULE
        【関西弁変換のルール】
        - 自然で日常的な関西弁（「〜してるん？」「〜やねん」など）にする。
      RULE
    when "frank"
      <<~RULE
        【関西弁変換のルール】
        - 砕けた雑談調（「〜やろ」「〜ちゃう？」など）にする。
        - 不自然な表現（例:「ありがとさんな」等）は使わない。
      RULE
    else
      ""
    end
  end

    # 絵文字だけ
  def strength_emoji_rule
    case @strength
    when "weak"
      <<~RULE
        【絵文字の使い方】
        - 絵文字は1文に1つ程度にしてください。
      RULE
    when "medium"
      <<~RULE
        【絵文字の使い方】
        - 絵文字は1文に2つ程度、もしくは単語ごとに1つ入れてください。
      RULE
    when "strong"
      <<~RULE
        【絵文字の使い方】
        - 絵文字は1文に3つ以上入れてください。単語ごとに複数入れても構いません。
      RULE
    else
      ""
    end
  end

  # 関西弁だけ
  def strength_kansai_rule
    case @strength
    when "weak"
      <<~RULE
        【関西弁変換のルール】
        - 柔らかく自然な関西弁にしてください。
        - 語尾は「〜やねん」「〜してるん？」など日常的な表現を使う。
        - 不自然な表現（例:『ありがとさんな』『ありがとやで』など）は使わない。
        - 言い換え例: 「突き当たり→どんつき」「白々しい→しらこい」「疲れた→しんどい」「行く途中・行きがけ→行きしな・行きし」「帰りがけ・帰る途中→帰りしな・帰りし」「同じ→おんなし」「動く→いごく」「違う→ちゃう」「大変→えらい」
          「しない→せぇへん/しぃひん」「いない→おらん」「そろそろ・まぁまぁ→ぼちぼち」「じゃあね・またね→ほなね/ほなまた」
      RULE
    when "medium"
      <<~RULE
        【関西弁変換のルール】
        - 自然で日常的な関西弁にしてください。
        - 語尾は「〜やろ」「〜ちゃう？」など。
        - 「ありがとう」は「ありがとうな」「助かるわ」へ。
        - 不自然で古い表現は避ける。
        - 言い換え例: 「突き当たり→どんつき」「白々しい→しらこい」「疲れた→しんどい」「行く途中・行きがけ→行きしな・行きし」「帰りがけ・帰る途中→帰りしな・帰りし」「同じ→おんなし」「動く→いごく」「違う→ちゃう」「大変→えらい」
          「しない→せぇへん/しぃひん」「いない→おらん」「そろそろ・まぁまぁ→ぼちぼち」「じゃあね・またね→ほなね/ほなまた」
      RULE
    when "strong"
      <<~RULE
        【関西弁変換のルール】
        - コテコテで濃い関西弁にしてください。
        - 吉本新喜劇風のノリも可。
        - 「ない」→「あらへん」、「怒る」→「いらう・かなん」等の強い言い換え。
        - 「ありがとう」は「おおきにな」、「お願い」は「頼むわ」。
        - 語尾は「〜やんけ」「〜やないか」なども可。
        - 言い換え例: 「突き当たり→どんつき」「白々しい→しらこい」「疲れた→しんどい」「行く途中・行きがけ→行きしな・行きし」「帰りがけ・帰る途中→帰りしな・帰りし」「同じ→おんなし」「動く→いごく」「違う→ちゃう」「大変→えらい」
          「しない→せぇへん/しぃひん」「いない→おらん」「そろそろ・まぁまぁ→ぼちぼち」「じゃあね・またね→ほなね/ほなまた」
      RULE
    else
      ""
    end
  end

  def emoji_rule
    case @radio_emoji
    when "no_kaomoji"
      "顔系絵文字（😊😂😢など）は一切使わないでください"
    when "no_icon"
      "アイコン系絵文字（📚🚗など）は使わないでください..."
    when "nothing"
      "絵文字は何でも使ってください"
    else
      ""
    end
  end

  # ---------------------------
  # プロンプト生成
  # ---------------------------
  def build_prompt
    case @emoji
    when "add"
      <<~PROMPT
        次のテキストに絵文字を追加してください：
        #{@base_prompt}

        条件:
        - #{tone_emoji_rule}
        - #{strength_emoji_rule}
        - #{emoji_rule}
        - 入力文をそのまま変換してください。不要な文を追加しないでください。
      PROMPT
    when "kansai"
      <<~PROMPT
        次のテキストを関西弁に翻訳してください：
        #{@base_prompt}

        条件:
        - #{tone_kansai_rule}
        - #{strength_kansai_rule}
        - 絵文字は絶対に使わない（絵文字に関する他の指示があっても無視する）
        - 入力文をそのまま変換し、不要な文は追加しないでください。
      PROMPT
    when "emoji_kansai"
      <<~PROMPT
        以下のテキストを関西弁＋絵文字付きにしてください：
        #{@base_prompt}

        条件:
        - #{tone_kansai_rule}
        - #{strength_kansai_rule}   # 関西弁の濃さ
        - #{strength_emoji_rule}    # 絵文字の量
        - #{emoji_rule}
        - 入力文をそのまま変換し、不要な文は追加しないでください。
      PROMPT
    else
      ""
    end
  end

  # ---------------------------
  # 出力後のフィルタ処理（ラジオボタンの内容に応じて絵文字を削除）
  # ---------------------------
  def clean_text(text)
    case @radio_emoji
    when "no_kaomoji"
      remove_face_emojis(text)
    when "no_icon"
      remove_icon_emojis(text)
    when "nothing"
      remove_face_and_icon_emojis(text)
    else
      text
    end
  end

  def remove_face_emojis(text)
    text.gsub(Regexp.union(FACE_EMOJIS), "")
  end

  def remove_icon_emojis(text)
    text.gsub(Regexp.union(ICON_EMOJIS), "")
  end

  def remove_face_and_icon_emojis(text)
    remove_icon_emojis(remove_face_emojis(text))
  end
end
