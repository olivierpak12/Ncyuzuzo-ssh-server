
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
