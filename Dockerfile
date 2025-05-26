
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    useradd -m ncyuzuzo && \
    echo 'ncyuzuzo:password123' | chpasswd && \
    mkdir /var/run/sshd && \
    mkdir -p /home/ncyuzuzo/.ssh && \
    chmod 700 /home/ncyuzuzo/.ssh && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "Port 12345" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 12345

CMD ["/usr/sbin/sshd", "-D"]
