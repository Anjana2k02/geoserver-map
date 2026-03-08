FROM kartoza/geoserver:2.23.0

ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=admin123
ENV GEOSERVER_DATA_DIR=/opt/geoserver/data_dir

# Copy shapefile into container
COPY data/ /opt/geoserver/data_dir/data/

EXPOSE 8080
