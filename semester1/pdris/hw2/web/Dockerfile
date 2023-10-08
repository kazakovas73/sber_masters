FROM python:3.8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y --no-install-recommends gcc

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN mkdir /web_django
WORKDIR /web_django

COPY requirements.txt /web_django/
RUN pip install --upgrade pip && pip install -r requirements.txt

ADD . /web_django/ 