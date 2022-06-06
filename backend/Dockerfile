FROM python:3.10-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /backend
RUN apt-get -y update -q\
    && apt-get install --no-install-recommends -y \
      build-essential \
      libpq5 \
      libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY requirements* /backend
RUN pip install -r requirements.lock

COPY . .
EXPOSE 8000
