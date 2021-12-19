FROM oryd/kratos:v0.5.5

WORKDIR /root
COPY . .
USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add mysql-client

ENTRYPOINT [ "sh", "run-kratos.sh" ]