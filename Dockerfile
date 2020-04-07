FROM node:6.15.0-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="CrazyMax" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/crazy-max/docker-syntaxhighlighter" \
  org.opencontainers.image.source="https://github.com/crazy-max/docker-syntaxhighlighter" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="CrazyMax" \
  org.opencontainers.image.title="SyntaxHighlighter" \
  org.opencontainers.image.description="Build SyntaxHighlighter javascript plugin" \
  org.opencontainers.image.licenses="MIT"

ENV COMMIT_ID="37724fdb55a4635798993d2d69667e499b62db4b"

RUN node -v \
  && npm -v \
  && apk --update --no-cache add \
    bzip2 \
    git \
    tar \
  && apk --update --no-cache add -t build-dependencies \
    g++ \
    make \
    python \
  && git clone https://github.com/syntaxhighlighter/syntaxhighlighter.git \
  && cd syntaxhighlighter \
  && git reset --hard $COMMIT_ID \
  && npm install \
  && npm install -g gulp \
  && apk del build-dependencies \
  && rm -rf /var/cache/apk/*

COPY run.sh /run.sh
COPY assets /

RUN cd syntaxhighlighter \
  && sed -i -e 's/.*Promise = global.Promise.*/Promise = require("bluebird");/' node_modules/songbird/lib/songbird.js \
  && gulp setup-project \
  && chmod a+x /run.sh

VOLUME [ "/syntaxhighlighter/dist" ]

WORKDIR /syntaxhighlighter
CMD [ "/run.sh" ]
