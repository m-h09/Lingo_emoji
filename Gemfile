source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'
gem 'rails', '~> 7.0.0'

group :development, :test do
  gem 'rspec-rails'           # テスト
  gem 'factory_bot_rails'     # テストデータ作成
  gem 'pry-byebug'           # デバッグ
  gem 'rubocop'              # コード品質チェック
end

group :development do
  gem 'better_errors'         # エラー画面改善
  gem 'binding_of_caller'     # better_errorsと併用
end
gem 'dotenv-rails', groups: [:development, :test]
gem 'ruby-openai'
gem 'bootstrap', '~> 5.0'
gem 'simple_form'