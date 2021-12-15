FROM python:3.8

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ALLOWED_HOST $DJANGO_ALLOWED_HOST
ENV DJANGO_SECRET_KEY $DJANGO_SECRET_KEY
ENV DJANGO_CORS_ORIGIN_WHITELIST $DJANGO_CORS_ORIGIN_WHITELIST

ARG DJANGO_ALLOWED_HOST
ARG DJANGO_SECRET_KEY
ARG DJANGO_CORS_ORIGIN_WHITELIST

WORKDIR /chat
COPY requirements.txt /chat
RUN pip install -r requirements.txt
COPY . /chat/
RUN chmod +x ./*.sh

ENTRYPOINT ["./entrypoint.sh" ]
