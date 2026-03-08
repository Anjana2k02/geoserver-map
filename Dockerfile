FROM kartoza/geoserver:2.23.0

ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=admin123
ENV GEOSERVER_DATA_DIR=/opt/geoserver/data_dir

# Create Catalina directories to prevent deployment warnings
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost && \
    chmod 755 /usr/local/tomcat/conf/Catalina/localhost

# Copy shapefile into container
COPY data/ /opt/geoserver/data_dir/data/

EXPOSE 8080
