ARG ALPINE_BASE=3.20

FROM alpine:${ALPINE_BASE} as builder

RUN apk add gcc libc-dev libusb-dev linux-headers

COPY usbreset.c .
RUN cc usbreset.c -o usbreset

FROM alpine:${ALPINE_BASE}

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="docker-usbreset" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/rugarci/docker-usbreset" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.schema-version="1.0"

RUN apk add bash findutils

COPY --from=builder /usbreset /usbreset
COPY reset.sh .
COPY run.sh .
RUN chmod +x usbreset && chmod +x reset.sh && chmod +x run.sh

ENTRYPOINT ["./run.sh"]
