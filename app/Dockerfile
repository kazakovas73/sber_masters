FROM python:3.8.3-alpine

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["tail", "-f", "/dev/null"]