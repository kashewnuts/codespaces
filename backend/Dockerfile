FROM python:3.9-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
ARG BUILD_ENV
WORKDIR /backend
RUN mkdir -p /data/static
RUN apt-get -y update -q\
    && apt-get install --no-install-recommends -y \
      build-essential \
      libpq5 \
      libpq-dev \
    && pip install poetry --no-cache-dir \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY pyproject.toml poetry.* /backend/
RUN if [ "$BUILD_ENV" = "production" ]; then poetry install --no-dev; else poetry install; fi

COPY . .
EXPOSE 8000
