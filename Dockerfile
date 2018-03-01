FROM node:6-alpine
MAINTAINER CrazyMax <crazy-max@users.noreply.github.com>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="syntaxhighlighter" \
  org.label-schema.description="Build SyntaxHighlighter javascript plugin" \
  org.label-schema.version=$VERSION \
  org.label-schema.url="https://github.com/crazy-max/docker-syntaxhighlighter" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/crazy-max/docker-syntaxhighlighter" \
  org.label-schema.vendor="CrazyMax" \
  org.label-schema.schema-version="1.0"

ENV COMMIT_ID="37724fdb55a4635798993d2d69667e499b62db4b"

RUN node -v \
  && npm -v \
  && apk --update --no-cache add \
    bzip2 git tar \
  && apk --update --no-cache add -t build-dependencies \
    g++ make python \
  && git clone https://github.com/syntaxhighlighter/syntaxhighlighter.git \
  && cd syntaxhighlighter \
  && git reset --hard $COMMIT_ID \
  && npm install \
  && npm install -g gulp \
  && apk del build-dependencies \
  && rm -rf /var/cache/apk/*

ADD run.sh /run.sh
ADD assets /

RUN cd syntaxhighlighter \
  && sed -i -e 's/.*Promise = global.Promise.*/Promise = require("bluebird");/' node_modules/songbird/lib/songbird.js \
  && gulp setup-project \
  && chmod a+x /run.sh

VOLUME [ "/syntaxhighlighter/dist" ]

WORKDIR "/syntaxhighlighter"
CMD [ "/run.sh" ]
