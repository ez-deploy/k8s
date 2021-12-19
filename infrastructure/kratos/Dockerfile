FROM oryd/kratos:latest

WORKDIR /
COPY . .
USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add mysql-client

ENTRYPOINT [ "sh", "run-kratos.sh" ]