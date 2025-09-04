FROM ruby:3.2.3
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# pg のビルドに必要
RUN apt-get update -qq && apt-get install -y -qq build-essential libpq-dev

WORKDIR /app

# 先にGemだけコピー → bundle（キャッシュ効かせる）
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -N && bundle install

# アプリ本体
COPY . .
# アセットプリコンパイル（ダミーキーを指定）
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile
EXPOSE 3000
CMD ["bash","-lc","bundle exec rails db:prepare && bundle exec rails server -b 0.0.0.0 -p 3000"]