FROM ubuntu:20.10 as builder

LABEL maintainer="Jason Ross <algorythm@gmail.com>"

ARG BUILD_DATE
ARG NAME
ARG DESCRIPTION
ARG VCS_REF
ARG VCS_URL
ARG VENDOR
ARG VERSION
ARG IMAGE_NAME

ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}
ENV TERM=${TERM}
ENV IBMCLOUD_COLOR=${IBMCLOUD_COLOR}


# Build-time metadata as defined at http://label-schema.org
LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="${NAME}" \
    org.label-schema.description="${DESCRIPTION}" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="${VCS_URL}" \
    org.label-schema.vendor="${VENDOR}" \
    org.label-schema.version="${VERSION}" \
    org.label.image-name="${IMAGE_NAME}"

COPY ./bin/container-install-prereqs.sh /tmp

# install the software pre-reqs
RUN ["/bin/bash", "-c","/tmp/container-install-prereqs.sh"]

# install AWS2
COPY ./bin/container-install-aws2.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-aws2.sh"]

# install Azure CLI
COPY ./bin/container-install-azure.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-azure.sh"]

# install gCloud SDK
COPY ./bin/container-install-gcp.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-gcp.sh"]

# install IBM Cloud SDK
COPY ./bin/container-install-ibmcloud.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-ibmcloud.sh"]

# install Scoutsuite
COPY ./bin/container-install-scoutsuite.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-install-scoutsuite.sh"]

# Remove scripts
RUN ["rm", "-rf", "/root/bin"]

# set up the user runtime environment
COPY ./bin/container-set-init.sh /tmp
RUN ["/bin/bash", "-c", "/tmp/container-set-init.sh"]

# set up the venv and leave users with a helpful login message
FROM builder
CMD ["bash"]
