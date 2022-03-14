FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# パッケージのインストール
RUN apt-get update && apt-get install -y \
  tzdata \
&& rm -rf /var/lib/apt/lists/*

# モジュールのインストール
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

# 環境変数の定義
ENV TZ=Asia/Tokyo
