FROM alpine:latest

# install python3 & pip
RUN apk add --no-cache python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# install request package
RUN apk --no-cache upgrade && \
    apk --no-cache add  postgresql-dev musl-dev gcc && \
    rm  -rf /tmp/* /var/cache/apk/*

# dev usage
#COPY requirements.txt /opt/src/
#WORKDIR /opt/src
RUN pip install --upgrade pip
    #pip install -r requirements.txt

#set tz
RUN apk add --no-cache tzdata
ENV TZ=Australia/Brisbane

# install ssh for remote interpreter
RUN apk --no-cache add openssh && \
    echo 'root:root' | chpasswd && \
    sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config && \
    sed -ri 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's:#HostKey /etc/ssh/ssh_host_key:HostKey /etc/ssh/ssh_host_rsa_key:' /etc/ssh/sshd_config && \
    sed -i 's:#HostKey /etc/ssh/ssh_host_rsa_key:HostKey /etc/ssh/ssh_host_rsa_key:' /etc/ssh/sshd_config && \
    sed -i 's:#HostKey /etc/ssh/ssh_host_dsa_key:HostKey /etc/ssh/ssh_host_rsa_key:' /etc/ssh/sshd_config && \
    sed -i 's:#HostKey /etc/ssh/ssh_host_ecdsa_key:HostKey /etc/ssh/ssh_host_rsa_key:' /etc/ssh/sshd_config && \
    sed -i 's:#HostKey /etc/ssh/ssh_host_ed25519_key:HostKey /etc/ssh/ssh_host_rsa_key:' /etc/ssh/sshd_config && \
    /usr/bin/ssh-keygen -A && \
    /usr/bin/ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key
CMD ["/usr/sbin/sshd","-D"]
#CMD while sleep 3600; do :; done

