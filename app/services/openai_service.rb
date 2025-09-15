# app/services/openai_service.rb
class OpenaiService
  def self.generate_text(prompt)
    client = OpenAI::Client.new

    system_prompt = case mode
                    when "add_emoji"
                      "入力文に絵文字を自然に追加してください"
                    when "kansai"
                      "入力文を自然な関西弁に翻訳してください"
                    when "emoji_kansai"
                      "入力文を自然な関西弁に翻訳し、絵文字を自然に追加してください"
                    case tone
                    when "formal"
                      "入力文の絵文字をフォーマルな表現にしてください"
                    when "casual"
                      "入力文の絵文字をカジュアルな表現にしてください"
                    when "frank"
                      "入力文の絵文字をフランクな表現にしてください"


    response = client.chat(
      parameters: {
        model: "gpt-4o-mini", # 軽量かつ高速
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end
