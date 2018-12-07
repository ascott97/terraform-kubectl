FROM alpine

ARG KUBECTL_VERSION="v1.13.0"
ARG TERRAFORM_VERSION="0.11.10"

RUN apk add --no-cache ca-certificates bash curl \
    && curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform.zip -d /usr/local/bin \
    && rm -rf terraform.zip

WORKDIR /root

CMD bash
