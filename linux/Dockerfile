FROM python:3.8.3-alpine

ENV PYTHONBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apk update

RUN apk add --no-cache openssh-client ansible git sshpass
RUN pip3 install docker

COPY ./ansible /ansible

WORKDIR /ansible

ENTRYPOINT [ "python3" ]

CMD ["tail", "-f", "/dev/null"]