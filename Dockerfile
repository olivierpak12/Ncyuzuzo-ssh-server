
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    useradd -m ncyuzuzo && \
    mkdir -p /home/ncyuzuzo/.ssh && \
    chmod 700 /home/ncyuzuzo/.ssh

COPY authorized_keys /home/ncyuzuzo/.ssh/authorized_keys

RUN chmod 600 /home/ncyuzuzo/.ssh/authorized_keys && \
    chown -R ncyuzuzo:ncyuzuzo /home/ncyuzuzo/.ssh && \
    mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
