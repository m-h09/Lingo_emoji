class OpenaiService
  def self.generate_text(prompt)
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])   # ENV['OPENAI_ACCESS_TOKEN'] を自動で読む
    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "user", content: prompt } ],
        temperature: 1.2
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end
