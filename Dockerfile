
FROM ubuntu:22.04

# Tegura ubutumwa
RUN apt-get update && \
    apt-get install -y openssh-server && \
    useradd -m ncyuzuzo && \
    echo 'ncyuzuzo:password123' | chpasswd && \
    mkdir /var/run/sshd && \
    mkdir -p /home/ncyuzuzo/.ssh && \
    chmod 700 /home/ncyuzuzo/.ssh && \
    chown ncyuzuzo:ncyuzuzo /home/ncyuzuzo/.ssh && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Railway ihindura port, dushyireho environment variable
ENV PORT=2222

# Gufungura iyo port
EXPOSE ${PORT}

# Gutangiza SSH server
CMD ["/usr/sbin/sshd", "-D", "-e"]
