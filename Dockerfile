ARG VERSION

FROM ubuntu:$VERSION

ENV TERM=xterm
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  ansible unzip \
  && mkdir -p /home/user \
  && echo "user:x:1000:1000:user:/home/user:/bin/bash" >> /etc/passwd \
  && echo "user:x:1000:" >> /etc/group \
  && chown -R user /home/user

RUN mkdir -p /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

COPY entrypoint.sh /entrypoint.sh
COPY playbook.yml /playbook.yml

ENTRYPOINT ["/entrypoint.sh"]