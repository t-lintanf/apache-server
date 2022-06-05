FROM debian:bullseye

# ssh access
RUN apt update && apt install openssh-server apache2 -y
COPY sshd_config /etc/ssh/sshd_config
RUN useradd -m -s /bin/bash thomas
RUN mkdir /home/thomas/.ssh
RUN chown thomas:thomas /home/thomas/.ssh
COPY --chown=thomas:thomas authorized_keys /home/thomas/.ssh/authorized_keys
RUN chmod 700 /home/thomas/.ssh
RUN chmod 600 /home/thomas/.ssh/authorized_keys

# apache server config
COPY apache2.conf /etc/apache2/apache2.conf
RUN mkdir /home/thomas/www
RUN chown thomas:thomas /home/thomas/www
RUN chmod 755 /home/thomas/www
STOPSIGNAL SIGWINCH

COPY startup.sh /usr/local/bin/

EXPOSE 80
EXPOSE 22
CMD ["startup.sh"]
