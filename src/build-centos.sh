#!/bin/bash
echo -e "\n\nbuild running...\n"
source .env.example

BUILD_CMD="docker build -f Dockerfile-centos\
-t ${IMAGE_NAME} \
--build-arg BUILD_DATE=${BUILD_DATE} \
--build-arg NAME=${NAME} \
--build-arg VCS_REF=${VCS_REF} \
--build-arg VCS_URL=${VCS_URL} \
--build-arg VENDOR=${VENDOR} \
--build-arg VERSION=${VERSION} \
--build-arg IMAGE_NAME=${IMAGE_NAME} \
."
# wtf. idk why this doesn't work
# --build-arg DESCRIPTION=\"${DESCRIPTION}\" \

echo -e "\n\nbuilding image using:\n${BUILD_CMD}"
exec ${BUILD_CMD}
