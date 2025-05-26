FROM ubuntu:22.04

# Disable prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install openssh-server and create user
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    useradd -m -s /bin/bash ncyuzuzo && \
    echo 'ncyuzuzo:ncyuzuzo123' | chpasswd && \
    mkdir -p /home/ncyuzuzo/.ssh && \
    chmod 700 /home/ncyuzuzo/.ssh && \
    mkdir /var/run/sshd

# Permit root login and user login via password
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitEmptyPasswords no' >> /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
