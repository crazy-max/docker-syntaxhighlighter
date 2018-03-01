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
  && apk --update --no-cache add bzip2 g++ git make python tar \
  && git clone https://github.com/syntaxhighlighter/syntaxhighlighter.git \
  && cd syntaxhighlighter \
  && git reset --hard $COMMIT_ID \
  && npm install \
  && npm install -g gulp \
  && rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh
ADD assets /

RUN chmod a+x /entrypoint.sh

VOLUME [ "/syntaxhighlighter/dist" ]

WORKDIR "/syntaxhighlighter"
ENTRYPOINT [ "/entrypoint.sh" ]
