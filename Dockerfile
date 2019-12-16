FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
COPY joplin_web       /app/
COPY requirements.txt /app/
COPY joplin-web-start.sh                /
WORKDIR /app/
RUN apk add npm python2 \
  && apk add --no-cache --virtual .build-deps gcc musl-dev alpine-sdk npm python2 \
  && pip install -U setuptools pip \
  && pip install --no-cache-dir -r requirements.txt \
  && npm update -g npm@latest --unsafe-perm \
  && NPM_CONFIG_PREFIX=/app/joplin-bin npm install -g joplin --unsafe-perm \
  && rm /app/requirements.txt /app/env.sample \
  && apk del .build-deps
RUN ["chmod", "+x", "/joplin-web-start.sh"]
CMD ["sh", "-c", "/joplin-web-start.sh"]
