FROM kartoza/geoserver:2.23.0

# Fix permission issue
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost && \
    chmod -R 777 /usr/local/tomcat/conf && \
    chmod -R 777 /usr/local/tomcat/logs && \
    chmod -R 777 /usr/local/tomcat/temp && \
    chmod -R 777 /usr/local/tomcat/work

# Set admin credentials
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=admin123
ENV GEOSERVER_DATA_DIR=/opt/geoserver/data_dir

# Copy shapefile into container
COPY data/ /opt/geoserver/data_dir/data/

EXPOSE 8080
