OpenAI.configure do |config|
  config.access_token = ENV["OPENAI_ACCESS_TOKEN"] || "dummy_key"
  # config.organization_id = ENV.fetch("OPENAI_ORGANIZATION_ID", nil) # 任意
end
