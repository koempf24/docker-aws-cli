# @see https://hub.docker.com/_/docker
FROM docker:stable

# @see https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.17.3"

# @see https://github.com/helm/helm/releases
ENV HELM_VERSION="v3.1.1"

# @see https://www.terraform.io/downloads.html
ENV TERRAFORM_VERSION="0.12.21"

RUN echo -e "http://nl.alpinelinux.org/alpine/v3.10/main\nhttp://nl.alpinelinux.org/alpine/v3.10/community" > /etc/apk/repositories

RUN apk --update add \
    python \
    python-dev \
    py-pip \
    jq \
    curl \
    git \
    tzdata \
    php \
    php-openssl \
    php-json

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/kubectl \
 && pip install awscli \
 && rm /var/cache/apk/*

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin
 && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
