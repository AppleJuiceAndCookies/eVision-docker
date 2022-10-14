FROM centos:7

EXPOSE 8080
EXPOSE 80

ARG IMAGE_TAG

RUN mkdir -p /opt/app

COPY app/bin/eVision-product-ops.linux.$IMAGE_TAG /opt/app/app.sh

RUN chmod +x /opt/app/app.sh

WORKDIR /opt/app
CMD sh app.sh
