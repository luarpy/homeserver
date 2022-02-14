FROM alpine:latest

# Idea: https://www.pybootcamp.com/blog/how-to-write-dockerfile-python-apps/

WORKDIR /app

COPY ./ ./

RUN addgroup --gid 10001 --system nonroot \
 && adduser  --uid 10000 --system --ingroup nonroot --home /home/nonroot nonroot

RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--", "entrypoint.sh"]
RUN apk add --no-cache \
    bind-tools \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libwebp-dev \
    build-essential \
    python3-dev \
    virtualenv \
    libffi-dev \
    redis \
    git \
    postgresql

RUN git clone git://github.com/gpodder/mygpo.git /app
RUN pip -r install requirements.txt

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

RUN chmod 755 ./entrypoint.sh

USER nonroot