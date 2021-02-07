FROM ruby:2.5.7
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /Training_app4
# コンテナ内にTraining_app4ディレクトリを作成

WORKDIR /Training_app4
# 作成したTraining_app4ディレクトリを作業用ディレクトリとして設定

COPY Gemfile /Training_app4/Gemfile
COPY Gemfile.lock /Training_app4/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のTraining_app4配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /Training_app4
# ローカルのTraining_app4配下のファイルをコンテナ内のTraining_app4配下にコピー
