FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk update && apk upgrade
RUN apk add --no-cache gcc musl-dev bash

WORKDIR /backend

COPY requirements.txt /backend/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /backend/

RUN chmod +x docker/entrypoint.sh
ENTRYPOINT ["sh", "docker/entrypoint.sh"]