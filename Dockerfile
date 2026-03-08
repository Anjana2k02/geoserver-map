FROM kartoza/geoserver:2.23.0

# Fix permissions
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost && \
    chmod -R 777 /usr/local/tomcat/conf && \
    chmod -R 777 /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/temp && \
    chmod -R 777 /usr/local/tomcat/work

# Reduce memory to fit Railway free tier
ENV INITIAL_MEMORY=256M
ENV MAXIMUM_MEMORY=512M
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=admin123
ENV GEOSERVER_DATA_DIR=/opt/geoserver/data_dir

COPY data/ /opt/geoserver/data_dir/data/

EXPOSE 8080