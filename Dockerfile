FROM ubuntu:20.04

RUN apt update \
  && apt install -y wget zip openssh-client apt-transport-https curl gnupg2

WORKDIR /root/
RUN wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip
RUN unzip terraform_1.0.4_linux_amd64.zip

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl

RUN mv /root/terraform /usr/local/bin