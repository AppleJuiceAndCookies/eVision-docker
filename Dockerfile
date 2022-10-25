FROM public.ecr.aws/docker/library/centos:centos7.9.2009

EXPOSE 8080
EXPOSE 80

ARG IMAGE_TAG

RUN mkdir -p /opt/app

COPY app/bin/eVision-product-ops.linux.$IMAGE_TAG /opt/app/eVision

RUN chmod +x /opt/app/eVision

WORKDIR /opt/app
CMD ["./eVision"]