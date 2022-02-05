FROM alpine:3.10

RUN apk --update --no-cache add \
                ca-certificates \
                openssh-client \
                openssl \
                python3 \
                sshpass \
                openjdk8-jre \
                util-linux \
                pciutils \
                coreutils \
                binutils \
                findutils \
                ansible \
                sudo \
                grep \
                curl \
                bash \
                shadow \
                git \
                jq
RUN apk add --no-cache --virtual .build-deps python3-dev \
                libffi-dev \
                openssl-dev \
                build-base \
                gcc \
                freetype-dev \
                libpng-dev \
                openblas-dev \
            && pip3 install --upgrade --no-cache-dir pip \
                wheel \
                cffi \
                packaging \
                pexpect \
                msrest \
                msrestazure \
                azure-core \
            && apk del --no-cache .build-deps

RUN cd /opt/ && \
     wget -O vault.zip  https://releases.hashicorp.com/vault/1.4.0/vault_1.4.0_linux_amd64.zip && \
     unzip vault.zip && \
     mv vault /usr/bin/

ARG JENKINS_URL=https://apptonate.com

RUN useradd -ms /bin/bash jenkins && \
    echo 'jenkins ALL=(ALL)    NOPASSWD: ALL' >> /etc/sudoers

COPY nightly.sh vault-role-id /home/jenkins/


RUN chown jenkins:jenkins  /home/jenkins/nightly.sh /home/jenkins/vault-role-id  \
    && chmod +x /home/jenkins/nightly.sh /home/jenkins/vault-role-id

WORKDIR /home/jenkins
#RUN wget ${JENKINS_URL}/jnlpJars/agent.jar && \
#    chmod 777 agent.jar

USER jenkins
EXPOSE 22
EXPOSE 50000
    



