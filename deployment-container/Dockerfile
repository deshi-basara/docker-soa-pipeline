#
# build: docker build -t deployment-container .
# start: docker run -v /var/run/docker.sock:/var/run/docker.sock -e SSH_PASSPHRASE="..." -ti deployment-container
#
FROM debian:jessie

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends git curl openssh-client expect nano \
    && rm -rf /var/lib/apt/lists/*

RUN curl --insecure -Lso /usr/bin/docker "https://get.docker.com/builds/Linux/x86_64/docker-1.8.1" \
    && curl --insecure -Lso /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/1.5.2/docker-compose-Linux-x86_64" \
    && chmod +x /usr/bin/docker /usr/bin/docker-compose \
    && mkdir -p /test/cache

COPY ssh.config /root/.ssh/config
COPY deploy-key /root/.ssh/id_rsa
COPY deploy-key.pub /root/.ssh/id_rsa.pub
COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod 600 /root/.ssh/id_rsa

COPY scripts/ /test/

WORKDIR /test

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./run-full-suite.sh"]
