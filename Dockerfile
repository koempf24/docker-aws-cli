# @see https://hub.docker.com/_/docker
FROM docker:20.10.3-dind

# @see https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.20.4"

# @see https://github.com/helm/helm/releases
ENV HELM_VERSION="v3.5.2"

# @see https://www.terraform.io/downloads.html
ENV TERRAFORM_VERSION="0.14.7"

RUN apk --update add \
    bash \
    python3 \
    python3-dev \
    py-pip \
    jq \
    curl \
    git \
    tzdata \
    php \
    php-openssl \
    php-json \
    php-curl \
    mysql-client

# kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 # helm
 && curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 # helm diff
 && /bin/helm plugin install https://github.com/databus23/helm-diff --version master \
 # awscli
 && pip install awscli \
 # Terraform
 && wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
 && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 # Clean up
 && rm /var/cache/apk/*
