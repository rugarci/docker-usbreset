 FROM alpine:3 as builder
 RUN apk add gcc libc-dev libusb-dev linux-headers
#FROM gcc as builder

COPY usbreset.c .
RUN cc usbreset.c -o usbreset

FROM alpine:3

COPY --from=builder /usbreset /usbreset
COPY reset.sh .
COPY run.sh .
RUN chmod +x usbreset && chmod +x reset.sh && chmod +x run.sh

ENTRYPOINT ["./run.sh"]
