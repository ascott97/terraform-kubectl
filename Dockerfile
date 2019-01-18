FROM alpine:latest

ARG KUBECTL_VERSION="v1.13.0"
ARG TERRAFORM_VERSION="0.11.10"
ARG AWS_IAM_AUTH_VERSION="1.11.5"

RUN apk add --no-cache ca-certificates bash curl python py-pip \
    && pip install awscli \
    && curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform.zip -d /usr/local/bin \
    && rm -rf terraform.zip
    && curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${AWS_IAM_AUTH_VERSION}/2018-12-06/bin/linux/amd64/aws-iam-authenticator
   && chmod +x /usr/local/bin/aws-iam-authenticator

WORKDIR /root

CMD bash
