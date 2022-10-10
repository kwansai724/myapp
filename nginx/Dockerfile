FROM nginx:1.21-alpine

ARG ENVIRONMENT

# TimeZoneをAsia/Tokyoに設定する
# ENV TZ Asia/Tokyo
# RUN echo "${TZ}" > /etc/timezone \
#   && dpkg-reconfigure -f noninteractive tzdata

# Nginxの設定ファイルをコンテナにコピー
COPY ./nginx.conf /etc/nginx/conf.d/app.conf
COPY ./conf.d/${ENVIRONMENT}.conf /etc/nginx/conf.d/one_api.conf

EXPOSE 10080

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf