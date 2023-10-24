# 使用指定映像
FROM python:3.9-slim-buster

# 安裝必要庫
RUN apt-get update && apt-get install -y git zsh && rm -rf /var/lib/apt/lists/*

# (可選，僅供參考) 建立並切換使用者
# RUN useradd -m myuser
RUN useradd -m -s /bin/zsh myuser
USER myuser