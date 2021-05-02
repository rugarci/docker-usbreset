FROM alpine as builder

RUN apk --update --upgrade add gcc libc-dev libusb-dev linux-headers
COPY usbreset.c .

RUN cc usbreset.c -o usbreset


FROM alpine:3

COPY --from=builder /usbreset /usbreset
COPY reset.sh .
COPY run.sh .
RUN chmod +x usbreset
RUN chmod +x reset.sh
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
