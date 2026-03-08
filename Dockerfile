FROM kartoza/geoserver:2.23.0

# Fix permission issue - different approach
USER root
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost && \
    mkdir -p /usr/local/tomcat/logs && \
    mkdir -p /usr/local/tomcat/temp && \
    mkdir -p /usr/local/tomcat/work && \
    chmod -R 777 /usr/local/tomcat/ && \
    chown -R root:root /usr/local/tomcat/

ENV INITIAL_MEMORY=256M
ENV MAXIMUM_MEMORY=512M
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=admin123
ENV GEOSERVER_DATA_DIR=/opt/geoserver/data_dir
ENV PORT=8080

COPY data/ /opt/geoserver/data_dir/data/

EXPOSE 8080