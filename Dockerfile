FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    useradd -m ncyuzuzo && \
    echo 'ncyuzuzo:password123' | chpasswd && \
    mkdir /var/run/sshd && \
    mkdir -p /home/ncyuzuzo/.ssh && \
    chmod 700 /home/ncyuzuzo/.ssh && \
    chown ncyuzuzo:ncyuzuzo /home/ncyuzuzo/.ssh && \
    sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]
