# Dockerfile（Render向け最小構成）
FROM ruby:3.2.3-slim
ENV RAILS_ENV=production RACK_ENV=production BUNDLE_WITHOUT="development test"
WORKDIR /app

# 必要パッケージ（pgのビルド/クライアント）
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential libpq-dev postgresql-client curl && \
    rm -rf /var/lib/apt/lists/*

# Gemをインストール
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -N && bundle install

# アプリ本体
COPY . .

# アセット前コンパイル（SECRET_KEY_BASEダミーでOK。credentials未使用前提）
ENV RAILS_LOG_TO_STDOUT=1
RUN bundle exec rake assets:precompile SECRET_KEY_BASE=dummy

EXPOSE 3000
CMD ["bash","-lc","bundle exec rails db:migrate && bundle exec rails server -b 0.0.0.0 -p 3000"]