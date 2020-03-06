FROM node:10-alpine

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN set -x \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    git alpine-sdk python \
    wqy-zenhei \
    udev \
    ttf-freefont \
    chromium
#https://github.com/puppeteer/puppeteer#q-why-doesnt-puppeteer-vxxx-work-with-chromium-vyyy
RUN npm install "puppeteer@chrome-$(chromium-browser --product-version | awk -F '.' '{print $1}')"
