FROM ubuntu:22.04

ARG PAPERCUT_MAJOR_VER=21.x
ARG PAPERCUT_VERSION=21.0.4.57587

ARG MYSQL_CONNECTOR_VERSION=8.0.30
ARG MYSQL_CONNECTOR_DOWNLOAD_URL=https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.tar.gz

# WORKDIR /papercut

COPY image_setup.py /app/image_setup.py
COPY setup.sh /app/setup.sh

RUN bash /app/setup.sh

EXPOSE 9191 \
        9192 \
        9193

ENTRYPOINT [ "/etc/init.d/papercut" ]
CMD [ "console" ]