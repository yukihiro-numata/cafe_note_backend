# ベースイメージの指定
FROM ruby:3.0.1

# 必要なパッケージのインストール
RUN apt-get update -qq

# 作業ディレクトリの作成と指定
RUN mkdir /cafe_note_backend
WORKDIR /cafe_note_backend

# ローカルのGemfileをコピーする
COPY ./Gemfile /cafe_note_backend/Gemfile
COPY ./Gemfile.lock /cafe_note_backend/Gemfile.lock

# bundle install(TODO: bundle installが遅い)
RUN bundle install
COPY . /cafe_note_backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]