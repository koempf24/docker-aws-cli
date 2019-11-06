FROM docker:stable

RUN echo -e "http://nl.alpinelinux.org/alpine/v3.10/main\nhttp://nl.alpinelinux.org/alpine/v3.10/community" > /etc/apk/repositories

RUN apk --update add \
    python \
    python-dev \
    py-pip \
    jq

RUN pip install awscli
